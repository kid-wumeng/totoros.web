module.exports = formatMarkStep = ( step ) ->

   switch step
      when 1 then '想看'
      when 2 then '正在看'
      when 3 then '看过'
      else        ''