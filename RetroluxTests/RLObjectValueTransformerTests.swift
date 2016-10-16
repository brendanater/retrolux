//
//  RLObjectValueTransformerTests.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 10/16/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation
import XCTest
import Retrolux

class RLObjectValueTransformerTests: XCTestCase {
    func testForwards() {
        class Test: RLObject {
            var name = ""
        }
        
        let dictionary: [String: Any] = [
            "name": "Bob"
        ]
        
        let transformer = RLObjectValueTransformer()
        XCTAssert(transformer.supports(targetType: Test.self))
        XCTAssert(transformer.supports(value: dictionary, targetType: Test.self, direction: .forwards))
        
        do {
            let test = try transformer.transform(dictionary, targetType: Test.self, direction: .forwards) as? Test
            print(test)
            XCTAssert(test?.name == "Bob")
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testBackwards() {
        class Test: RLObject {
            var name = ""
        }
        
        let dictionary: [String: Any] = [
            "name": "bob"
        ]
        
        let transformer = RLObjectValueTransformer()
        XCTAssert(transformer.supports(targetType: Test.self))
        XCTAssert(transformer.supports(value: dictionary, targetType: Test.self, direction: .forwards))
        
        do {
            let test = Test()
            test.name = "success"
            let dictionary = try transformer.transform(test, targetType: Test.self, direction: .backwards) as? [String: Any]
            XCTAssert(dictionary?["name"] as? String == "success")
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testSetProperty() {
        class Test: RLObject {
            var name = ""
            var nested: Test?
        }
        
        do {
            let test = Test()
            let properties = try test.properties()
            XCTAssert(properties.first?.name == "name")
            XCTAssert(properties.last?.name == "nested")
            XCTAssert(properties.last?.type == PropertyType.optional(wrapped: .transformable(transformer: RLObjectValueTransformer(), targetType: Test.self)))
            try test.set(value: ["name": "success"], forProperty: properties.last!)
            XCTAssert(test.nested?.name == "success")
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testNestedInDictionary() {
        class Test: RLObject {
            var name = ""
            var nested: [String: Test] = [:]
        }
        
        let nestedDictionary: [String: Any] = [
            "bob": [
                "name": "Bob",
                "nested": [:]
            ],
            "alice": [
                "name": "Alice",
                "nested": [:]
            ]
        ]
        
        do {
            let test = Test()
            let properties = try test.properties()
            XCTAssert(properties.first?.name == "name")
            XCTAssert(properties.count == 2)
            XCTAssert(properties.last?.name == "nested")
            XCTAssert(properties.last?.type == PropertyType.dictionary(type: PropertyType.transformable(transformer: RLObjectValueTransformer(), targetType: Test.self)))
            try test.set(value: nestedDictionary, for: properties.last!)
            XCTAssert(test.nested["bob"]?.name == "Bob")
            XCTAssert(test.nested["alice"]?.name == "Alice")
            XCTAssert(test.nested.count == 2)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testNestedArrayAndDictionary() {
        class Test: RLObject {
            var name = ""
            var nested: [[String: Test]] = []
        }
        
        let nestedArray: [[String: Any]] = [
            [
                "bob": [
                    "name": "Bob",
                    "nested": []
                ],
                "alice": [
                    "name": "Alice",
                    "nested": []
                ]
            ],
            [
                "robert": [
                    "name": "Robert",
                    "nested": []
                ],
                "alicia": [
                    "name": "Alicia",
                    "nested": []
                ]
            ],
            ]
        
        do {
            let test = Test()
            let properties = try test.properties()
            XCTAssert(properties.first?.name == "name")
            XCTAssert(properties.count == 2)
            XCTAssert(properties.last?.name == "nested")
            XCTAssert(properties.last?.type == PropertyType.array(type: PropertyType.dictionary(type: PropertyType.transformable(transformer: RLObjectValueTransformer(), targetType: Test.self))))
            try test.set(value: nestedArray, for: properties.last!)
            XCTAssert(test.nested.count == 2)
            XCTAssert(test.nested[0]["bob"]?.name == "Bob")
            XCTAssert(test.nested[0]["alice"]?.name == "Alice")
            XCTAssert(test.nested[1]["robert"]?.name == "Robert")
            XCTAssert(test.nested[1]["alicia"]?.name == "Alicia")
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // TODO: Test nested backwards and fowards.
    
    // TODO: Test error handling.
}