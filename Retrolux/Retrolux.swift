//
//  Retrolux.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 6/4/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation

public enum RetroluxException: ErrorType {
    case SerializerError(message: String)
}

public class Retrolux {
    public static let sharedInstance = Retrolux()
    public var serializer = Serializer()
    
    public class var serializer: Serializer {
        return sharedInstance.serializer
    }
}