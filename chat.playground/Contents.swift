//: Playground - noun: a place where people can play

import UIKit

import SocketIOClientSwift

let socket = SocketIOClient(socketURL: NSURL(string: "http://localhost:8080")!, options: [.Log(true), .ForcePolling(true)])

socket.on("connect") {data, ack in
    print("socket connected")
}

socket.on("currentAmount") {data, ack in
    if let cur = data[0] as? Double {
        socket.emitWithAck("canUpdate", cur)(timeoutAfter: 0) {data in
            socket.emit("update", ["amount": cur + 2.50])
        }
        
        ack.with("Got your currentAmount", "dude")
    }
}

socket.connect()