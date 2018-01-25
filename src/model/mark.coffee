subject = require('./subject')


exports.STATUSES = [
  'will-do'
  'doing'
  'done'
  'do-not'
]


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
    when 7  then '巅峰'
    when 6  then '杰作水准'
    when 5  then '优秀'
    when 4  then '还算有亮点'
    when 3  then '一般般'
    when 2  then '差'
    when 1  then '让人反感'
    else         '不评价这项'


exports.validFavor = (type, item) =>
  switch
    when subject.isType(type, 'anime')       then ['story', 'image', 'music'].includes(item)
    when subject.isType(type, 'comic-paint') then ['image'].includes(item)
    when subject.isType(type, 'comic')       then ['story', 'image'].includes(item)
    when subject.isType(type, 'game')        then ['story', 'image', 'music', 'enjoy'].includes(item)
    when subject.isType(type, 'novel')       then ['story'].includes(item)
    else false


exports.isShowItem = (type, item) =>
  switch
    when subject.isType(type, 'anime')       then ['story', 'image', 'music'].includes(item)
    when subject.isType(type, 'comic-paint') then ['image'].includes(item)
    when subject.isType(type, 'comic')       then ['story', 'image'].includes(item)
    when subject.isType(type, 'game')        then ['story', 'image', 'music', 'enjoy'].includes(item)
    when subject.isType(type, 'novel')       then ['story'].includes(item)
    else false