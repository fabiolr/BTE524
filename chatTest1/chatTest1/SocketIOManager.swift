//
//  SocketIOManager.swift
//  chatTest1
//
//  Created by Fabio Ribeiro on 4/19/16.
//  Copyright © 2016 Fabio Ribeiro. All rights reserved.
//

import UIKit

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    override init() {
        super.init()
    }
    
var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.13.15:3000")!)
    
    
        func establishConnection() {
            socket.connect()
        }
        
        
        func closeConnection() {
            socket.disconnect()
        }

        func connectToServerWithNickname(nickname: String, completionHandler: (userList: [[String: AnyObject]]!) -> Void) {
            socket.emit("adduser", nickname)
            socket.on("updateusers") { ( dataArray, ack) -> Void in
                completionHandler(userList: dataArray[0] as! [[String: AnyObject]])
            }
        
            
        func sendMessage(message: String, withNickname nickname: String) {
                socket.emit("chat message", nickname, message)
            }

        func getChatMessage(completionHandler: (messageInfo: [String: AnyObject]) -> Void) {
                socket.on("chat message") { (dataArray, socketAck) -> Void in
                    var messageDictionary = [String: AnyObject]()
                    messageDictionary["message"] = dataArray[1] as! String
                    messageDictionary["date"] = dataArray[2] as! String
                    
                    completionHandler(messageInfo: messageDictionary)
                }
            }
            
    }
    
}


