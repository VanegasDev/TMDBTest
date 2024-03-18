//
//  KeychainManager.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import Security

class KeychainManager: Storage {
    
    private func createDictionary(key: String, data: Data) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Bundle.main.bundleIdentifier!,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
        ]
    }
    
    func get(key: String) -> Data? {
        var query = createDictionary(key: key, data: Data())
        query[kSecReturnData as String] = kCFBooleanTrue as CFBoolean
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let data = result as? Data else {
            return nil
        }
        
        return data
    }
    
    func save(data: Data, key: String) throws {
        let query = createDictionary(key: key, data: data)
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            if status == errSecDuplicateItem {
                // Item already exists, update it
                let updateQuery = createDictionary(key: key, data: data)
                let updateStatus = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)
                
                if updateStatus != errSecSuccess {
                    throw KeychainError.updateFailed
                }
            } else {
                throw KeychainError.unknownError(status)
            }
        }
    }
    
    func remove(key: String) {
        let query = createDictionary(key: key, data: Data())
        SecItemDelete(query as CFDictionary)
    }
}

enum KeychainError: Error {
    case updateFailed
    case unknownError(OSStatus)
}
