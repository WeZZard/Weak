//
//  WeakTests.swift
//  Weak
//
//  Created by WeZZard on 17/10/2018.
//

import XCTest

@testable
import Weak


class WeakTests: XCTestCase {
    func testValue_holds_a_weak_reference() {
        var weakReference: Weak<NSObject>!
        autoreleasepool {
            let strongReference = NSObject()
            weakReference = Weak(strongReference)
            XCTAssert(weakReference!.value != nil)
        }
        XCTAssert(weakReference!.value == nil)
    }
    
    func testEqual_wraps_any_objects_reference_equal() {
        let objects: [NSObject] =  [
            NSString(string: "test"),
            NSObject(),
            NSSet(),
            NSDictionary(),
            NSArray()
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Weak(lhs) == Weak(rhs)) == (lhs == rhs))
            }
        }
    }
    
    func testEqual_wraps_equatable_objects_equal() {
        let objects =  [
            NSString(string: "testA"),
            NSString(string: "testB"),
            NSString(string: "testC"),
            NSString(string: "testD")
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Weak(lhs) == Weak(rhs)) == (lhs.isEqual(to: rhs)))
            }
        }
    }
    
    func testReferenceEqual_wraps_any_objects_reference_equal() {
        let objects: [NSObject] =  [
            NSString(string: "test"),
            NSObject(),
            NSSet(),
            NSDictionary(),
            NSArray()
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Weak(lhs) === Weak(rhs)) == (lhs === rhs))
            }
        }
    }
    
    func testHashValue_returns_hashable_objects_hashValue() {
        var hashValues = Set<Int>()
        while hashValues.count < 1 {
            let object = NSSet()
            let hashValue = object.hashValue
            hashValues.insert(hashValue)
            XCTAssert(Weak(object).hashValue == hashValue)
        }
    }
}
