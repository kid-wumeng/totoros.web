### 是否数字字符串 ##
# @params {string} n
# @return {boolean}
###
exports.isNumber = (n) ->
  return /^\d+(?:\.\d+)?$/.test(n.toString())



### 是否Email地址 ##
# @params {string} email
# @return {boolean}
###
exports.isEmail = (email) ->
  reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/
  return reg.test(email.toString())



### 是否URL ##
# @params {string} url
# @return {boolean}
###
exports.isUrl = (url) ->
  reg = /(((^https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)$/
  return reg.test(url.toString())



### 统计字符串长度，单字节占1位，双字节占2位 ##
# @params {string}
# @return {number}
###
exports.lenString = (string='') ->
  doubleReg = /[^\x00-\xff]/
  len = 0
  for char in string
    len += if doubleReg.test(char) then 2 else 1
  return len



### 截断字符串，单字节占1位，双字节占2位 ##
# @params {string}
# @params {number} start
# @params {number} end
# @return {string}
# @TODO 待补
###
exports.sliceString = (string='', start, end) ->



### ES2017 padStart ##
# @params {*}      value
# @params {number} len
# @params {string} char
# @params {string}
###
exports.padStart = (value, len, char) ->
  value = value.toString()
  count = len - value.length
  while count > 0
    value = char + value
    count--
  return value



### 移除字符串前后空白 ##
# @params {string}
# @return {string}
###
exports.trim = (string) ->
  return string.replace(/^\s+|\s+$/g, '')



exports.parseUrl = (url) ->
  dict = {}
  urlReg = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
  result = urlReg.exec(url)
  fields = ['url', 'scheme', 'slash', 'host', 'port', 'path', 'query', 'hash']
  fields.forEach (field, i) ->
    dict[field] = result[i]
  return dict



exports.parseQuery = (queryString) ->
  query = {}
  array = queryString.split(/(?:&amp;)|&/)
  for item in array
    [name, value=true] = item.split('=')
    query[name] = value
  return query



exports.checkCommentContent = (content) ->
  if !content
    throw "内容不能为空"
  if @lenString(content) > 5000
    throw "内容太长了"



exports.displayCastImportance = (importance) ->
  switch importance
    when 4 then '主人公'
    when 3 then '核心配角'
    when 2 then '配角'
    when 1 then '龙套'
    else ''