module.exports = formatSubjectType = ( type ) ->

   switch type
      when 'comic' then '漫画'
      when 'paint' then '绘本'
      when 'movie' then '动画电影'
      when 'serie' then 'TV/OVA'
      else              ''