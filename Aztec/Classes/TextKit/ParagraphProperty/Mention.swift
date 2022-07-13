//
//  Mention.swift
//  
//
//  Created by Stefan Petkovic on 13.7.22..
//

import Foundation

public struct MentionObject: Equatable {
    let dataDenotationChar: String!
    let dataId: Int!
    let dataValue: String!
    let dataType: String
    
    public static func ==(lhs: MentionObject, rhs: MentionObject) -> Bool {
        return lhs.dataDenotationChar == rhs.dataDenotationChar && lhs.dataId == rhs.dataId && lhs.dataValue == rhs.dataValue && rhs.dataType == lhs.dataType
    }
}

class Mention: ParagraphProperty {

    let mentionUser: MentionObject?
    let mentionTask: MentionObject?
    let start: Int!

    init(mentionUser: MentionObject?, mentionTask: MentionObject?, with representation: HTMLRepresentation? = nil) {
        self.mentionUser = mentionUser
        self.mentionTask = mentionTask
        
        if let representation = representation, case let .element( html ) = representation.kind {
            
            if let startAttribute = html.attribute(ofType: .start),
                case let .string( value ) = startAttribute.value,
                let start = Int(value)
            {
                self.start = start
            }else {
                self.start = nil
            }
        }else {
            self.start = nil
        }
        super.init(with: representation)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.mentionTask = nil
        self.mentionUser = nil
        self.start = nil
//        if aDecoder.containsValue(forKey: String(describing: Style.self)),
//            let decodedStyle = Style(rawValue:aDecoder.decodeInteger(forKey: String(describing: Style.self))) {
//            style = decodedStyle
//        } else {
//            style = .ordered
//        }
//        if aDecoder.containsValue(forKey: AttributeType.start.rawValue) {
//            let decodedStart = aDecoder.decodeInteger(forKey: AttributeType.start.rawValue)
//            start = decodedStart
//        } else {
//            start = nil
//        }
//
//        if aDecoder.containsValue(forKey: AttributeType.reversed.rawValue) {
//            let decodedReversed = aDecoder.decodeBool(forKey: AttributeType.reversed.rawValue)
//            reversed = decodedReversed
//        } else {
//            reversed = false
//        }

        super.init(coder: aDecoder)
    }

    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(MentionObject.self, forKey: String(describing: MentionObject.self))
        aCoder.encode(start, forKey: AttributeType.start.rawValue)
    }

    public static func ==(lhs: Mention, rhs: Mention) -> Bool {
        return lhs.mentionUser == rhs.mentionUser && lhs.start == rhs.start && lhs.mentionTask == rhs.mentionTask
    }
}
