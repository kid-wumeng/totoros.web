exports.displayImportance = (importance) ->
  switch importance
    when 4 then '主人公'
    when 3 then '核心配角'
    when 2 then '配角'
    when 1 then '龙套'
    else ''