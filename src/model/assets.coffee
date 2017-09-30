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
exports.lenString = (string) ->
  doubleReg = /[^\x00-\xff]/
  len = 0
  for char in string
    len += if doubleReg.test(char) then 2 else 1
  return len



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