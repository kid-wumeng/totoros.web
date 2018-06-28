module.exports = formatSubjectWay = ( way ) ->

   switch way
      when 'tv'  then 'TV-Series'
      when 'ova' then 'OVA'
      when 'web' then 'WEB'
      else            ''