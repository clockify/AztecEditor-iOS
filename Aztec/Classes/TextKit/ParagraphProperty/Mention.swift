//
//  Mention.swift
//
//
//  Created by Stefan Petkovic on 13.7.22..
//

import Foundation

public struct MentionObject: Equatable {
    
    public enum DataType: String {
        case user = "user"
        case team = "team"
        case task = "item"
    }
    
    let dataDenotationChar: String
    let dataId: Int
    let dataValue: String
    let dataType: String
    
    var mentionType: DataType {
        return DataType(rawValue: dataType)!
    }
    
    public static func ==(lhs: MentionObject, rhs: MentionObject) -> Bool {
        return lhs.dataDenotationChar == rhs.dataDenotationChar && lhs.dataId == rhs.dataId && lhs.dataValue == rhs.dataValue && rhs.dataType == lhs.dataType
    }
}

class Mention: ParagraphProperty, NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Mention(mentionUser: nil, mentionTask: nil, with: self.representation)
    }

    let mentionUser: MentionObject?
    let mentionTask: MentionObject?
    var isEmoji: Bool = false
    let identifier: UUID = UUID()

    init(mentionUser: MentionObject?, mentionTask: MentionObject?, with representation: HTMLRepresentation? = nil) {
        if let representation = representation, case let .element( html ) = representation.kind {
            
            if let dataType = html.attribute(ofType: .dataType)?.value.toString(), let dataID = Int(html.attribute(ofType: .dataID)!.value.toString()!), let dataValue = html.attribute(ofType: .dataValue)?.value.toString(), let mentionChar = html.attribute(ofType: .dataDenotationChar)?.value.toString() {
                let mentionObject = MentionObject(dataDenotationChar: mentionChar, dataId: dataID, dataValue: dataValue, dataType: dataType)
                if mentionObject.mentionType == .task {
                    self.mentionTask = mentionObject
                    self.mentionUser = nil
                }else {
                    self.mentionUser = mentionObject
                    self.mentionTask = nil
                }
            }else {
                self.mentionTask = nil
                self.mentionUser = nil
            }
        }else {
            self.mentionTask = nil
            self.mentionUser = nil
        }
        super.init(with: representation)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.mentionTask = nil
        self.mentionUser = nil

        super.init(coder: aDecoder)
    }

    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    public static func ==(lhs: Mention, rhs: Mention) -> Bool {
        return lhs.mentionUser == rhs.mentionUser && lhs.mentionTask == rhs.mentionTask && lhs.identifier == rhs.identifier
    }
}

public struct EmojiObject: Equatable {
    
    let classValue: String
    let dataNameValue: String
    let contenteditableValue: String
    let childClassValue: String
    let text: String
    
    public static func ==(lhs: EmojiObject, rhs: EmojiObject) -> Bool {
        return lhs.classValue == rhs.classValue && lhs.dataNameValue == rhs.dataNameValue && lhs.contenteditableValue == rhs.contenteditableValue && rhs.childClassValue == lhs.childClassValue && rhs.text == lhs.text
    }
    
    public func getAttributes() -> [Attribute] {
        let classAttribute = Attribute(name: "class", value: Attribute.Value(withString: classValue))
        let dataNameAttribute = Attribute(name: "data-name", value: Attribute.Value(withString: dataNameValue))
        let contenteditableAttribute = Attribute(name: "contenteditable", value: Attribute.Value(withString: contenteditableValue))
        let childClassAttribute = Attribute(name: "childClass", value: Attribute.Value(withString: childClassValue))
        let textAttribute = Attribute(name: "text", value: Attribute.Value(withString: text))

        return [classAttribute, dataNameAttribute, contenteditableAttribute, childClassAttribute, textAttribute]
    }
}

class EmojiParagraphPropery: ParagraphProperty, NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return EmojiObject(classValue: emojiObject.classValue , dataNameValue: emojiObject.dataNameValue, contenteditableValue: emojiObject.contenteditableValue, childClassValue: emojiObject.childClassValue, text: emojiObject.text)
    }

    let emojiObject: EmojiObject!
    let identifier: UUID = UUID()

    init(emojiObject: EmojiObject) {
        self.emojiObject = emojiObject
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.emojiObject = nil

        super.init(coder: aDecoder)
    }

    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    public static func ==(lhs: EmojiParagraphPropery, rhs: EmojiParagraphPropery) -> Bool {
        return lhs.emojiObject == rhs.emojiObject
    }
}
