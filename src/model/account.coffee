assets = require('./assets')


exports.checkEmail = (email) ->
  if !email
    throw '请填写登录邮箱'
  if email.length > 100
    throw '登录邮箱太长了'
  if !assets.isEmail(email)
    throw '登录邮箱不是一个正确的Email地址'


exports.checkPass = (pass, pass2) ->
  if !pass
    throw '请填写密码'
  if !pass2
    throw '请再次输入密码'
  if pass.length < 6
    throw '密码不能少于6位'
  if pass.length > 18
    throw '密码不能多于18位'
  if /^(?:\w|-|\.)+$/.test(pass) is false
    throw '密码只能使用以下半角字符：大小写英文字母、数字、下划线、中划线、点号'
  if pass isnt pass2
    throw '两次输入的密码不一致'


exports.checkName = (name) ->
  if !name
    throw '请填写昵称'
  if /^(?:\w|-|\.|[\u4E00-\u9FA5])+$/.test(name) is false
    throw '昵称只能使用以下字符：中文、英文、数字、下划线、中划线、点号'
  if assets.lenString(name) < 3
    throw '昵称不能少于3位（每个中文占2位）'
  if assets.lenString(name) > 18
    throw '昵称不能多于18位（每个中文占2位）'


exports.checkMotto = (motto='') ->
  if assets.lenString(name) > 200
    throw '签名不能多于200位（每个中文占2位）'


exports.checkIntro = (intro='') ->
  if assets.lenString(name) > 5000
    throw '简介不能多于5000位（每个中文占2位）'