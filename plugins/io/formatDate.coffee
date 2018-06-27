module.exports = formatDate = ( date, time = false ) ->

   ########################################
   #|
   #|   格式化日期
   #|
   #|   @params {Date}    date
   #|   @params {boolean} time
   #|   @return {string}  text - '2018-03-12 18:45'
   #|
   ########################################

   if Sai.data.isDate(date)
      if time
         return Sai.time.format(date, 'YYYY-MM-DD HH:II')
      else
         return Sai.time.format(date, 'YYYY-MM-DD')
   else
      return ''