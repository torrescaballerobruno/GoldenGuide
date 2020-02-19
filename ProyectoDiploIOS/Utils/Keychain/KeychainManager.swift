//
//  KeychainManager.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 19/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import Foundation

struct KeychainManager{
    
    static let shared = KeychainManager()
    private let keychain = KeychainSwift()
    
    func retrieveKey(key: String) -> String?{
        return keychain.get(key)
    }
    
    func saveKey(data: String, key: String){
        keychain.set(data, forKey: key)
    }
    
    func deleteKey(key: String){
        keychain.delete(key) // Remove single key
    }
}

