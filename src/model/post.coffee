assets = require('./assets')


exports.checkTitle = (title) ->
  if !title
    throw '请填写标题'
  if assets.lenString(title) > 100
    throw '标题太长了'


exports.checkContent = (content) ->
  if !content
    throw '请填写内容'
  if assets.lenString(content) > 60000
    throw '内容太长了'