subject = require('./subject')


exports.isShowScore = (status) =>
  return ['doing', 'done', 'do-not'].includes(status)


exports.isShowFavor = (status) =>
  return ['doing', 'done'].includes(status)


exports.displayStatus = (status, type) =>
  verb = @displayVerb(type)
  switch status
    when 'will-do' then "想#{verb}"
    when 'doing'   then "正在#{verb}"
    when 'done'    then "#{verb}过"
    when 'do-not'  then "弃置"


exports.displayVerb = (type) =>
  switch
    when subject.isType(type, 'anime') then '看'
    when subject.isType(type, 'comic') then '看'
    when subject.isType(type, 'game')  then '玩'
    when subject.isType(type, 'novel') then '读'


exports.validFavor = (type, item) =>
  switch
    when subject.isType(type, 'anime')       then ['story', 'image', 'music'].includes(item)
    when subject.isType(type, 'comic-paint') then ['image'].includes(item)
    when subject.isType(type, 'comic')       then ['story', 'image'].includes(item)
    when subject.isType(type, 'game')        then ['story', 'image', 'music', 'enjoy'].includes(item)
    when subject.isType(type, 'novel')       then ['story'].includes(item)
    else false