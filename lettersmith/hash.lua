local map = require("lettersmith.foldable").map
local extend = require("lettersmith.table_utils").extend
local md5sum = require("md5").sumhexa

return function (docs_foldable)
  -- Add hash metadata field to all documents.
  -- This field contains the 32 hexadecimal digits of the md5sum of the document contents.
  -- Returns new list of documents with the md5 metadata field mixed in.
  -- Fields from document take precedence.
  return map(docs_foldable, function (doc)
    return extend({ hash=md5sum(doc.contents) } , doc)
  end)
end
