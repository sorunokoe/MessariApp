//
//  BaseViewModel.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

class BaseViewModel {
    
    var loading: Box<Bool> = Box(false)
    var error: Box<String> = Box("")
    
}
