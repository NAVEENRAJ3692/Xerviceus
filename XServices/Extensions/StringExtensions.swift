//
//  StringExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension String {
    
    
    var lowercaseFirst: String {
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
        return result
    }
    
    var upperCaseInitial: String {
        if self.count > 0 {
            return String(self.first!).uppercased()
        }
        
        return ""
    }
    
    func firstCharacter() -> String {
        if count == 0 {
            return ""
        } else {
            return "\(self.first!)".uppercased()
        }
    }
    
    
    func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    
}

