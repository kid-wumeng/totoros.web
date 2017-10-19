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


exports.displayScore = (score) =>
  switch score
    when 10 then '神之作'
    when 9  then '至高杰作'
    when 8  then '很棒'
    when 7  then '优秀'
    when 6  then '还不错'
    when 5  then '一般'
    when 4  then '平庸'
    when 3  then ''
    when 2  then ''
    when 1  then ''


exports.validFavor = (type, item) =>
  switch
    when subject.isType(type, 'anime')       then ['story', 'image', 'music'].includes(item)
    when subject.isType(type, 'comic-paint') then ['image'].includes(item)
    when subject.isType(type, 'comic')       then ['story', 'image'].includes(item)
    when subject.isType(type, 'game')        then ['story', 'image', 'music', 'enjoy'].includes(item)
    when subject.isType(type, 'novel')       then ['story'].includes(item)
    else false