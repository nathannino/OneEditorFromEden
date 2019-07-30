/// @description  DerpXmlWrite_Comment(commentText)
/// @param commentText
//
//  Writes a comment element on a new line, e.g. <!--commentText-->

var commentText = argument0

with objDerpXmlWrite {
    if lastWriteType == DerpXmlType_CloseTag {
        writeString += newlineString
        repeat currentIndent {
            writeString += indentString
        }
    }
    
    writeString += "<!--"+commentText+"-->"
    lastWriteEmptyElement = false
}
