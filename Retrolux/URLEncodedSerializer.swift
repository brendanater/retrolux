//
//  URLEncodedSerializer.swift
//  Retrolux
//
//  Created by Bryan Henderson on 12/22/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation

public class URLEncodedSerializer: Serializer {
    public init() {
        
    }
    
    public func supports(inboundType: Any.Type) -> Bool {
        return false
    }
    
    public func supports(outbound: [Any]) -> Bool {
        return outbound.flatMap { $0 is URLEncodedBody }.count == 1
    }
    
    public func makeValue<T>(from clientResponse: ClientResponse, type: T.Type) throws -> T {
        fatalError("This serializer only supports outbound serialization.")
    }
    
    public func apply(arguments: [Any], to request: inout URLRequest) throws {
        assert(arguments.count == 1)
        
        let body = arguments.first as! URLEncodedBody
        
        var components = URLComponents()
        components.queryItems = body.values.map { URLQueryItem(name: $0, value: $1) }
        let string = components.percentEncodedQuery
        let data = string?.data(using: .utf8)
        request.httpBody = data
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    }
}