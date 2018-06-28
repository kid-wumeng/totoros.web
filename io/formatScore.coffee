module.exports = formatScore = ( score ) ->

   switch score
      when 'world' then '世界观'
      when 'story' then '剧情'
      when 'roles' then '角色'
      when 'paint' then '画风'
      when 'music' then '音乐'
      else              ''