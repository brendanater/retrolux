//
//  ValueTransformer.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 10/16/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation

public enum ValueTransformerDirection {
    case forwards
    case backwards
}

// If property is like:
//     var friend: Person?
// then targetType will be Person.self.
//
// If property is like:
//     var friend: [Person] = []
// then targetType will still be Person.self.
public protocol ValueTransformer {
    func supports(targetType: Any.Type) -> Bool
    func transform(_ value: Any, targetType: Any.Type, direction: ValueTransformerDirection) throws -> Any
}

internal func rlobj_transform(_ value: Any, type: PropertyType, transformer: ValueTransformer, direction: ValueTransformerDirection) throws -> Any {
    switch type {
    case .anyObject:
        return value
    case .optional(let wrapped):
        return try rlobj_transform(value, type: wrapped, transformer: transformer, direction: direction)
    case .bool:
        return value
    case .number:
        return value
    case .string:
        return value
    case .transformable(transformer: let transformer, targetType: let targetType):
        return try transformer.transform(value, targetType: targetType, direction: direction)
    case .array(let element):
        guard let array = value as? [Any] else {
            throw RLObjectError.typeMismatch(expected: type, got: type(of: value), property: "", forClass: Int.self)
        }
        var result: [Any] = []
        for item in array {
            let toAppend = try rlobj_transform(item, type: element, transformer: transformer, direction: direction)
            print("toAppend:", toAppend)
            result.append(toAppend)
        }
        return result
    case .dictionary(let valueType):
        guard let dictionary = value as? [String: Any] else {
            throw RLObjectError.typeMismatch(expected: type, got: type(of: value), property: "", forClass: Int.self)
        }
        var result: [String: Any] = [:]
        for (key, value) in dictionary {
            result[key] = try rlobj_transform(value, type: valueType, transformer: transformer, direction: direction)
        }
        return result
    }
}
