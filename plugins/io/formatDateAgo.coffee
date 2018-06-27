module.exports = formatDateAgo = ( date ) ->

   ########################################
   #|
   #|   格式化日期
   #|
   #|   @params {Date}   date
   #|   @return {string} dateText - '2018-03-12 18:45'
   #|
   ########################################

   if Sai.data.isDate(date)

      duration = Sai.time.from(date)

      switch
         when duration.mss     <= 999 then return "刚才"
         when duration.seconds <= 60  then return "#{duration.seconds}秒前"
         when duration.minutes <= 60  then return "#{duration.minutes}分钟前"
         when duration.hours   <= 24  then return "#{duration.hours}小时前"
         when duration.days    <= 365 then return "#{duration.days}天前"
         else                              return "#{parseInt(duration.days/365)}年前"

   else
      return ''