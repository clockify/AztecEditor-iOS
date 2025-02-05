import UIKit

public extension NSAttributedString.Key {

    /// Key used to store Mention tags Metadata..
    ///
    static let mentionTag: NSAttributedString.Key = NSAttributedString.Key("mentionTag")
    
    /// Key used to store Mention tags Metadata..
    ///
    static let emojiTag: NSAttributedString.Key = NSAttributedString.Key("emojiTag")

    /// Key used to store Header tags Metadata, by our HeaderFormatter.
    ///
    static let headingRepresentation: NSAttributedString.Key = NSAttributedString.Key("headingRepresentation")

    /// Key used to store Bold Tag Metadata, by our BoldFormatter.
    ///
    static let boldHtmlRepresentation = NSAttributedString.Key("Bold.htmlRepresentation")

    /// Key used to store Color Tags Metadata, by our ColorFormatter.
    ///
    static let colorHtmlRepresentation = NSAttributedString.Key("Color.htmlRepresentation")

    /// Key used to store HR Tag Metadata, by our HRFormatter.
    ///
    static let hrHtmlRepresentation = NSAttributedString.Key("HR.htmlRepresentation")

    /// Key used to store Image Tag Metadata, by our ImageFormatter.
    ///
    static let imageHtmlRepresentation = NSAttributedString.Key("Image.htmlRepresentation")

    /// Key used to store Italics Tag Metadata, by our ItalicFormatter.
    ///
    static let italicHtmlRepresentation = NSAttributedString.Key("Italic.htmlRepresentation")

    /// Key used to store Link Tag Metadata, by our LinkFormatter.
    ///
    static let linkHtmlRepresentation = NSAttributedString.Key("Link.htmlRepresentation")

    /// Key used to store Strike Tag Metadata, by our StrikeFormatter.
    ///
    static let strikethroughHtmlRepresentation = NSAttributedString.Key("Strike.htmlRepresentation")

    /// Key used to store UnderlineHTMLRepresentations, by our UnderlineFormatter.
    ///
    static let underlineHtmlRepresentation = NSAttributedString.Key("Underline.htmlRepresentation")

    /// Key used to store UnsupportedHTML Snippets, by our HTML Parser.
    ///
    static let unsupportedHtml = NSAttributedString.Key("UnsupportedHTMLAttributeName")

    /// Key used to store VideoHTMLRepresentations, by our VideoFormatter.
    ///
    static let videoHtmlRepresentation = NSAttributedString.Key("Video.htmlRepresentation")

    /// Key used to store codeHTMLRepresentations, by our CodeFormatter.
    ///
    static let codeHtmlRepresentation = NSAttributedString.Key("Code.htmlRepresentation")

    /// Key used to store citeHTMLRepresentations, by our CiteFormatter.
    ///
    static let citeHtmlRepresentation = NSAttributedString.Key("Cite.htmlRepresentation")

    /// Key used to store Sup Tag Metadata, by our SupFormatter.
    ///
    static let supHtmlRepresentation = NSAttributedString.Key("Sup.htmlRepresentation")

    /// Key used to store Sub Tag Metadata, by our SupFormatter.
    ///
    static let subHtmlRepresentation = NSAttributedString.Key("Sub.htmlRepresentation")

    /// Key used to store Mark Tag Metadata, by our MarkFormatter.
    ///
    static let markHtmlRepresentation = NSAttributedString.Key("Mark.htmlRepresentation")
}
