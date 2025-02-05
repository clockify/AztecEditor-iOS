import Foundation


public struct AttributeType: RawRepresentable, Hashable {
    
    public typealias RawValue = String
    
    public let rawValue: String
    
    // MARK: - CSS Support
    
    public static var cssAttributeTypes: Set<AttributeType> = [.style]
    
    // MARK: - Initializers
    
    public init?(rawValue: RawValue) {
        self.init(rawValue)
    }
    
    public init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    // MARK: - Equatable
    
    public static func ==(lhs: AttributeType, rhs: AttributeType) -> Bool{
        return lhs.rawValue.lowercased() == rhs.rawValue.lowercased()
    }
}


extension AttributeType {
    public static let `class` = AttributeType("class")
    public static let href = AttributeType("href")
    public static let rel = AttributeType("rel")
    public static let src = AttributeType("src")
    public static let style = AttributeType("style")
    public static let target = AttributeType("target")
    public static let reversed = AttributeType("reversed")
    public static let start = AttributeType("start")
    public static let dataType = AttributeType("data-type")
    public static let dataDenotationChar = AttributeType("data-denotation-char")
    public static let dataID = AttributeType("data-id")
    public static let dataValue = AttributeType("data-value")
}
