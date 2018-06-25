module.exports = formatSubjectType = ( type ) ->

   switch type
      when 'comic' then '漫画'
      when 'paint' then '绘本'
      when 'anime' then '系列动画'
      when 'movie' then '剧场版'
      else              ''