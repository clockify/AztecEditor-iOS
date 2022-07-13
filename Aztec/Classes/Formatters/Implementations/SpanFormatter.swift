//
//  SpanFormatter.swift
//  Aztec
//
//  Created by Stefan Petkovic on 12.7.22..
//  Copyright © 2022 Automattic Inc. All rights reserved.
//

import Foundation
import UIKit

open class SpanFormatter: AttributeFormatter {
    
    var user: [String: Any] = [:]
    var foregroundColor: UIColor = UIColor(hex: "F85383")
    var backgroundColor: UIColor = UIColor(hex: "78789A").withAlphaComponent(0.5)
    
    init(for user: [String: Any]) {
        self.user = user
    }
    
    func present(in attributes: [NSAttributedString.Key : Any]) -> Bool {
        return (attributes[.foregroundColor] as? UIColor) == self.foregroundColor && (attributes[.backgroundColor] as? UIColor) == self.backgroundColor
    }
    
    func apply(to attributes: [NSAttributedString.Key : Any], andStore representation: HTMLRepresentation?) -> [NSAttributedString.Key : Any] {
        var resultingAttributes = attributes
        resultingAttributes[.foregroundColor] = self.foregroundColor
        resultingAttributes[.backgroundColor] = self.backgroundColor
        return resultingAttributes
    }
    
    func remove(from attributes: [NSAttributedString.Key : Any]) -> [NSAttributedString.Key : Any] {
        return [:]
    }
    
    func applicationRange(for range: NSRange, in text: NSAttributedString) -> NSRange {
        NSRange(location: 0, length: 0)
    } 
}
