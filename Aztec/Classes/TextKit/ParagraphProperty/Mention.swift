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
        aCoder.encode(MentionObject.self, forKey: String(describing: MentionObject.self))
        aCoder.encode(UUID.self, forKey: "identifier")
    }

    public static func ==(lhs: Mention, rhs: Mention) -> Bool {
        return lhs.mentionUser == rhs.mentionUser && lhs.mentionTask == rhs.mentionTask && lhs.identifier == rhs.identifier
    }
}
