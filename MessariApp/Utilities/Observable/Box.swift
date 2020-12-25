//
//  Box.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct Listener<T> {
  
  let handler: Box<T>.ListenerHandler
  let atMainQueue: Bool
  
}

class Box<T> {
  
  typealias ListenerHandler = (T) -> Void
  
  var listeners = [Listener<T>]()
  var atMainQueue = false
  
  var value: T {
    didSet {
      let emit = value
      
      listeners.forEach { listener in
        if listener.atMainQueue {
          DispatchQueue.main.async {
            listener.handler(emit)
          }
        } else {
          listener.handler(value)
        }
      }
    }
  }
  
  var mainQueue: Box {
    atMainQueue = true
    return self
  }
  
  // MARK: Initializers
  init(_ value: T) {
    self.value = value
  }

}

// MARK: Public Methods
extension Box {
  
  func bind(fireNow: Bool = false, handler: @escaping ListenerHandler) {
    let listener = Listener(handler: handler, atMainQueue: atMainQueue)
    listeners.append(listener)
    
    if fireNow {
      listener.handler(value)
    }
    
    atMainQueue = false
  }
  
}
