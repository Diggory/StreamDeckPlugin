//
//  WebSocketTaskPublisher.swift
//
//
//  Created by Emory Dunn on 5/23/21.
//

import Foundation
import Combine

extension URLSession {
    
    /// Returns a publisher that wraps a URL session WebSocket task for a given URL.
    ///
    /// The provided URL must have a `ws` or `wss` scheme.
    /// - Parameter url: The WebSocket URL with which to connect.
    func webSocketTaskPublisher(for url: URL) -> WebSocketTaskPublisher {
        WebSocketTaskPublisher(with: url, session: self)
    }
}

/// A publisher that delivers the messages from a WebSocket.
struct WebSocketTaskPublisher: Publisher {
    
    typealias Output = URLSessionWebSocketTask.Message
    
    typealias Failure = Error
    
    let task: URLSessionWebSocketTask
    
    /// Creates a WebSocket task publisher from the provided URL and URL session.
    ///
    /// The provided URL must have a `ws` or `wss` scheme.
    /// - Parameters:
    ///   - url: The WebSocket URL with which to connect.
    ///   - session: The URLSession to create the WebSocket task.
    init(with url: URL, session: URLSession = URLSession.shared) {
        self.task = session.webSocketTask(with: url)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Error == S.Failure, URLSessionWebSocketTask.Message == S.Input {
        
        let subscription = Subscription(task: task, target: subscriber)
        subscriber
            .receive(subscription: subscription)

    }
    
    /// Sends a WebSocket message, receiving the result in a completion handler.
    ///
    /// If an error occurs while sending the message, any outstanding work also fails.
    /// - Parameters:
    ///   - message: The WebSocket message to send to the other endpoint.
    ///   - completionHandler: A closure that receives an NSError that indicates an error encountered while sending, or nil if no error occurred.
    func send(_ message: URLSessionWebSocketTask.Message, completionHandler: @escaping (Error?) -> Void) {
        task.send(message, completionHandler: completionHandler)
    }
    
}

extension WebSocketTaskPublisher {
    class Subscription<Target: Subscriber>: Combine.Subscription where Target.Input == Output, Target.Failure == Error {
        
        let task: URLSessionWebSocketTask
        var target: Target?

        init(task: URLSessionWebSocketTask, target: Target) {
            self.task = task
            self.target = target
        }
        
        func request(_ demand: Subscribers.Demand) {
            guard let target = target else { return }
            
            // Resume the task
            task.resume()
            
            listen(for: target, with: demand)
            
        }
        
        func listen(for target: Target, with demand: Subscribers.Demand) {
            var demand = demand
            
            self.task.receive { [weak self] result in
                switch result {
                case let .success(message):
                    demand -= 1
                    demand += target.receive(message)
                case let .failure(error):
                    target.receive(completion: .failure(error))
                }
                
                if demand > 0 {
                    self?.listen(for: target, with: demand)
                }
            }
        }

        func cancel() {
            task.cancel()
            target = nil
        }
    }
}
