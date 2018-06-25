module.exports = formatSubjectType = ( type ) ->

   switch type
      when 'comic' then '漫画'
      when 'paint' then '绘本'
      when 'anime' then 'TV/OVA'
      when 'movie' then '动画电影'
      else              ''