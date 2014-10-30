--[[
Lettersmith Drafts

Remove drafts from rendered docs. A drafts is any document that has `draft: yes`
in the headmatter section.

Usage:

    local use_drafts = require('lettersmith.drafts')
    local lettersmith = require('lettersmith')

    local docs = lettersmith.docs('raw')

    docs = use_drafts(docs)

    build(docs, "out")
--]]
local streams = require("streams")
local reject = streams.reject

return function (docs)
  -- Reject all documents that are drafts.
  -- Returns a new generator list of documents that are not drafts.
  return reject(docs, function (doc)
    return doc.draft
  end)
end