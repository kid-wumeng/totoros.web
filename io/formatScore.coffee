module.exports = formatScore = ( score ) ->

   switch score
      when 7       then '神作'
      when 6       then '杰作'
      when 5       then '好看'
      when 4       then '中等偏上'
      when 3       then '中等偏下'
      when 2       then '差作'
      when 1       then '极反感'

      when 'world' then '世界观'
      when 'story' then '剧情'
      when 'roles' then '角色'
      when 'paint' then '画风'
      when 'music' then '音乐'
      else              ''