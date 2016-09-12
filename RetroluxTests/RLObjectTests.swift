//
//  RLObjectTests.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 7/12/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation
import Retrolux
import XCTest

extension RetroluxTests {
    func testRLObjectProperties() {
        class Model: RLObject {
            dynamic var name = ""
            dynamic var yolo = false
        }
        
        do {
            let properties = try Model().properties()
            let properties2 = try RLObjectReflector().reflect(Model())
            let properties3 = try Model().properties() // Just in case caching is miserably broken
            XCTAssert(Set(properties) == Set(properties2) && Set(properties2) == Set(properties3))
        } catch let error {
            XCTFail("\(error)")
        }
    }
    
    func setPropertiesHelper(properties: [Property], dictionary: [String: AnyObject], instance: RLObjectProtocol) {
        XCTAssert(Set(properties.map({ $0.name })) == Set(dictionary.keys))
        
        for property in properties {
            do {
                try instance.set(value: dictionary[property.name], forProperty: property)
            } catch let error {
                XCTFail("\(error)")
            }
        }
        
        for property in properties {
            print(property.mappedTo)
            let isNSNull = dictionary[property.mappedTo] is NSNull
            let screened: NSObject? = isNSNull ? nil : dictionary[property.mappedTo] as? NSObject
            XCTAssert(instance.valueFor(property) as? NSObject == screened || !property.required)
        }
    }
    
    func testRLObjectBasicSerialization() {
        class Model: RLObject {
            dynamic var name = ""
            dynamic var age = 0
            dynamic var whatever = false
            dynamic var meta = [String: String]()
            dynamic var model: Model?
        }
        
        let dictionary = [
            "name": "Brian",
            "age": 23,
            "whatever": true,
            "meta": [
                "place_of_birth": "Bluffdale, UT",
                "height": "5' 7\""
            ],
            "model": NSNull()
        ]
        
        do {
            let model = Model()
            let properties = try RLObjectReflector().reflect(model)
            setPropertiesHelper(properties, dictionary: dictionary, instance: model)
        }
        catch let error {
            XCTFail("\(error)")
        }
    }
    
    func testRLObjectIgnoredProperties() {
        class Object: RLObject {
            dynamic var name = ""
            dynamic var age = 0
            
            override class var ignoredProperties: [String] {
                return ["name"]
            }
        }
        
        do {
            let properties = try RLObjectReflector().reflect(Object())
            XCTAssert(Set(properties.map({ $0.name })) == Set(["age"]))
        } catch let error {
            XCTFail("\(error)")
        }
    }
    
    func testRLObjectIgnoredErrorsForProperties() {
        class Object: RLObject {
            dynamic var name = "default_value"
            dynamic var age = 0
            
            override class var ignoreErrorsForProperties: [String] {
                return ["name"]
            }
        }
        
        do {
            let object = Object()
            let properties = try RLObjectReflector().reflect(object)
            guard let nameProp = properties.filter({ $0.name == "name" }).first else {
                XCTFail("Name property was missing")
                return
            }
            try object.set(value: NSNull(), forProperty: nameProp)
            XCTAssert(object.name == "default_value")
        } catch let error {
            XCTFail("\(error)")
        }
    }
    
    func testRLObjectMappedProperties() {
        class Object: RLObject {
            dynamic var description_ = ""
            
            override class var mappedProperties: [String: String] {
                return ["description_": "description"]
            }
        }
        
        do {
            let properties = try RLObjectReflector().reflect(Object())
            let prop = properties.first
            XCTAssert(properties.count == 1 && prop?.mappedTo == "description" && prop?.name == "description_")
        } catch let error {
            XCTFail("\(error)")
        }
    }
    
    /*
     Tests that inheritance is properly supported when the base class is RLObject.
     */
    func testRLObjectInheritance() {
        class Plain: RLObject {
            dynamic var bad = ""
            
            override func set(value value: Any?, forProperty property: Property) throws {
                try super.set(value: "bad", forProperty: property)
            }
            
            override func valueFor(property: Property) -> Any? {
                return "bad"
            }
            
            override func validate() -> String? {
                return "bad"
            }
            
            override class var ignoredProperties: [String] {
                return ["bad"]
            }
            
            override class var ignoreErrorsForProperties: [String] {
                return ["bad"]
            }
            
            override class var mappedProperties: [String: String] {
                return ["bad": "bad"]
            }
        }
        
        class Problematic: Plain {
            override func set(value value: Any?, forProperty property: Property) throws {
                try super.set(value: "good", forProperty: property)
            }
            
            override func valueFor(property: Property) -> Any? {
                return "good"
            }
            
            override func validate() -> String? {
                return "good"
            }
            
            override class var ignoredProperties: [String] {
                return ["good"]
            }
            
            override class var ignoreErrorsForProperties: [String] {
                return ["good"]
            }
            
            override class var mappedProperties: [String: String] {
                return ["good": "good"]
            }
        }
        
        let proto: RLObjectProtocol.Type = Problematic.self
        XCTAssert(proto.ignoredProperties == ["good"])
        XCTAssert(proto.ignoreErrorsForProperties == ["good"])
        XCTAssert(proto.mappedProperties == ["good": "good"])
        let instance = proto.init()
        let property = Property(type: .string, name: "bad", required: true, mappedTo: "bad")
        try! instance.set(value: "bad", forProperty: property)
        XCTAssert(instance.valueFor(property) as? String == "good")
        XCTAssert(proto.init().validate() == "good")
    }
}