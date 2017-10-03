assets = require('./assets')


exports.format = (format, date) ->
  year   = date.getFullYear()
  month  = date.getMonth() + 1
  day    = date.getDate()
  hour   = date.getHours()
  minute = date.getMinutes()
  second = date.getSeconds()

  Year   = assets.padStart(year,   4, '0')
  Month  = assets.padStart(month,  2, '0')
  Day    = assets.padStart(day,    2, '0')
  Hour   = assets.padStart(hour,   2, '0')
  Minute = assets.padStart(minute, 2, '0')
  Second = assets.padStart(second, 2, '0')

  return format.replace /(YY|MM|DD|HH|II|SS|yy|mm|dd|hh|ii|ss)/g, (placeholder) =>
    switch placeholder
      when 'YY' then Year
      when 'MM' then Month
      when 'DD' then Day
      when 'HH' then Hour
      when 'II' then Minute
      when 'SS' then Second
      when 'yy' then year
      when 'mm' then month
      when 'dd' then day
      when 'hh' then hour
      when 'ii' then minute
      when 'ss' then second


exports.display = (date) ->
  now          = new Date()
  milliSeconds = now.getTime() - date.getTime()
  seconds      = parseInt(milliSeconds / 1000)

  if seconds <= 0
    return "刚刚"

  if seconds < 60
    return "#{seconds}秒前"

  minutes = parseInt(seconds / 60)

  if minutes < 60
    return "#{minutes}分钟前"

  hours = parseInt(minutes / 60)

  if hours < 24
    return "#{hours}小时前"

  days = parseInt(hours / 24)

  if days <= 5
    return "#{days}天前"

  return @format('YY-MM-DD')