//
//  Weak.swift
//  Weak
//
//  Created by WeZZard on 7/26/15.
//
//


/// `Weak` hold a weak reference to an object.
///
public struct Weak<T: AnyObject> {
    private weak var _value: T?
    
    public var value: T? { return _value }
    
    public init(_ aValue: T?) { _value = aValue }
}

extension Weak where T: Equatable {
    public static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Weak where T: Hashable {
    public var hashValue: Int {
        return value?.hashValue ?? 0
    }
}

public func ===<T1, T2>(lhs: Weak<T1>, rhs: Weak<T2>) -> Bool {
    return lhs.value === rhs.value
}
