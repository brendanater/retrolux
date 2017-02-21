//
//  Serializer.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 10/8/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation

public protocol Serializer {}

public protocol OutboundSerializer: Serializer {
    func supports(outbound: [BuilderArg]) -> Bool
    func apply(arguments: [BuilderArg], to request: inout URLRequest) throws
}

public protocol InboundSerializer: Serializer {
    func supports(inboundType: Any.Type) -> Bool
    func makeValue<T>(from clientResponse: ClientResponse, type: T.Type) throws -> T
}
