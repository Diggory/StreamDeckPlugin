//
//  File.swift
//  
//
//  Created by Emory Dunn on 10/31/21.
//

import Foundation

enum TestEvent {
    
    static let registrationInfo = """
    {
      "application": {
        "font": ".AppleSystemUIFont",
        "language": "en",
        "platform": "mac",
        "platformVersion": "11.4.0",
        "version": "5.0.0.14247"
      },
      "plugin": {
        "uuid": "com.elgato.counter",
        "version": "1.4"
      },
      "devicePixelRatio": 2,
      "colors": {
        "buttonPressedBackgroundColor": "#303030FF",
        "buttonPressedBorderColor": "#646464FF",
        "buttonPressedTextColor": "#969696FF",
        "disabledColor": "#F7821B59",
        "highlightColor": "#F7821BFF",
        "mouseDownColor": "#CF6304FF"
      },
      "devices": [
        {
          "id": "55F16B35884A859CCE4FFA1FC8D3DE5B",
          "name": "Device Name",
          "size": {
            "columns": 5,
            "rows": 3
          },
          "type": 0
        },
        {
          "id": "B8F04425B95855CF417199BCB97CD2BB",
          "name": "Another Device",
          "size": {
            "columns": 3,
            "rows": 2
          },
          "type": 1
        }
      ]
    }
    """
    
    static let didReceiveSettings = """
        {
          "action": "com.elgato.example.didReceiveSettings",
          "event": "didReceiveSettings",
          "context": "opaqueValue",
          "device": "opaqueValue",
          "payload": {
            "settings": {},
            "coordinates": {
              "column": 3,
              "row": 1
            },
            "isInMultiAction": false
          }
        }
        """.data(using: .utf8)!
    
    static let didReceiveGlobalSettings = """
        {
          "event": "didReceiveGlobalSettings",
          "payload": {
            "settings": {
              "someKey": "someValue"
            }
          }
        }
        """.data(using: .utf8)!
    
    static var keyDown = """
        {
            "action": "com.elgato.example.keyDown",
            "event": "keyDown",
            "context": "opaqueValue",
            "device": "opaqueValue",
            "payload": {
                "settings": {},
                "coordinates": {
                    "column": 3,
                    "row": 1
                },
                "state": 0,
                "userDesiredState": 1,
                "isInMultiAction": false
            }
        }
        """.data(using: .utf8)!
    
    static let keyUp = """
    {
        "action": "com.elgato.example.keyUp",
        "event": "keyUp",
        "context": "opaqueValue",
        "device": "opaqueValue",
        "payload": {
            "settings": {},
            "coordinates": {
                "column": 3,
                "row": 1
            },
            "state": 0,
            "userDesiredState": 1,
            "isInMultiAction": false
        }
    }
    """.data(using: .utf8)!
    
    static let willAppear = """
        {
            "action": "com.elgato.example.willAppear",
            "event": "willAppear",
            "context": "opaqueValue",
            "device": "opaqueValue",
            "payload": {
                "settings": {},
                "coordinates": {
                    "column": 3,
                    "row": 1
                },
                "state": 0,
                "isInMultiAction": false
            }
        }
        """.data(using: .utf8)!
    
    static let willDisappear = """
        {
            "action": "com.elgato.example.willDisappear",
            "event": "willDisappear",
            "context": "opaqueValue",
            "device": "opaqueValue",
            "payload": {
                "settings": {},
                "coordinates": {
                    "column": 3,
                    "row": 1
                },
                "state": 0,
                "isInMultiAction": false
            }
        }
        """.data(using: .utf8)!
    
    static let titleParametersDidChange = """
        {
          "action": "com.elgato.example.titleParametersDidChange",
          "event": "titleParametersDidChange",
          "context": "opaqueValue",
          "device": "opaqueValue",
          "payload": {
            "coordinates": {
              "column": 3,
              "row": 1
            },
            "settings": {},
            "state": 0,
            "title": "",
            "titleParameters": {
              "fontFamily": "",
              "fontSize": 12,
              "fontStyle": "",
              "fontUnderline": false,
              "showTitle": true,
              "titleAlignment": "bottom",
              "titleColor": "#ffffff"
            }
          }
        }
        """.data(using: .utf8)!
    
    static let deviceDidConnect = """
        {
            "event": "deviceDidConnect",
            "device": "deviceDidConnect",
             "deviceInfo": {
                "name": "Device Name",
                "type": 0,
                 "size": {
                    "columns": 5,
                    "rows": 3
                }
            },
        }
        """.data(using: .utf8)!
    
    static let deviceDidDisconnect = """
        {
            "event": "deviceDidDisconnect",
            "device": "deviceDidDisconnect"
        }
        """.data(using: .utf8)!
    
    static let systemDidWakeUp = """
        {
            "event": "systemDidWakeUp"
        }
        """.data(using: .utf8)!
    
    static let applicationDidLaunch = """
        {
            "event": "applicationDidLaunch",
            "payload" : {
                "application": "com.test.launch"
            }
        }
        """.data(using: .utf8)!
    
    static let applicationDidTerminate = """
        {
            "event": "applicationDidTerminate",
            "payload" : {
                "application": "com.test.terminate"
            }
        }
        """.data(using: .utf8)!
    
    static let propertyInspectorDidAppear = """
        {
          "action": "com.elgato.example.propertyInspectorDidAppear",
          "event": "propertyInspectorDidAppear",
          "context": "opaqueValue",
          "device": "opaqueValue"
        }
        """.data(using: .utf8)!
    
    static let propertyInspectorDidDisappear = """
        {
          "action": "com.elgato.example.propertyInspectorDidDisappear",
          "event": "propertyInspectorDidDisappear",
          "context": "opaqueValue",
          "device": "opaqueValue"
        }
        """.data(using: .utf8)!
    
    static let sendToPlugin = """
        {
          "action": "com.elgato.example.sendToPlugin",
          "event": "sendToPlugin",
          "context": "opaqueValue",
          "payload": {}
        }
        """.data(using: .utf8)!

}
