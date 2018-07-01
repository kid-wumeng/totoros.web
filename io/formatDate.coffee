module.exports = formatDate = ( date, auto = false ) ->

   ########################################
   #|
   #|   格式化日期
   #|
   #|   @params {Date}    date
   #|   @params {Boolean} auto
   #|   @return {string}  text - '15分钟前' | '2018-03-12 18:45'
   #|
   ########################################

   if Sai.data.isDate(date)

      if !auto
          return Sai.time.format(date, 'YYYY-MM-DD')

      duration = Sai.time.from(date)

      switch
         when duration.mss     <= 999 then return "just now"
         when duration.seconds <= 60  then return "#{duration.seconds} seconds ago"
         when duration.minutes <= 60  then return "#{duration.minutes} minutes ago"

      isCurrentYear  = Sai.time.year(date)  is Sai.time.year(new Date())
      isCurrentMonth = Sai.time.month(date) is Sai.time.month(new Date())
      isCurrentDay   = Sai.time.day(date)   is Sai.time.day(new Date())

      hour = Sai.time.hour(date)

      if isCurrentYear and isCurrentMonth and isCurrentDay
         switch
            when hour < 6  then return Sai.time.format(date, '凌晨 HH:II')
            when hour < 12 then return Sai.time.format(date, '上午 HH:II')
            when hour < 18 then return Sai.time.format(date, '下午 HH:II')
            when hour < 24 then return Sai.time.format(date, '晚上 HH:II')

      if duration.hours < 24 + hour
            return Sai.time.format(date, '昨天 HH:II')

      if duration.hours < 48 + hour
            return Sai.time.format(date, '前天 HH:II')

      if duration.days < 365
         return Sai.time.format(date, 'MM-DD')
      else
         return Sai.time.format(date, 'YYYY-MM-DD')

   else
      return ''