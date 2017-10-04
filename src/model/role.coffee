exports.displayKey = (key) =>
  switch key
    when 'face'        then '封面'
    when 'name'        then '角色名'
    when 'nameOrigin'  then '原名'
    when 'nameAliases' then '别名'
    when 'intro'       then '简介'
    when 'birthDate'   then '出生日期'
    when 'deathDate'   then '逝世日期'
    else ''