exports.PERSON_JOBS       = [101..104]
exports.ORGANIZATION_JOBS = [201..206]


exports.displayJob = (job) ->
  switch job
    when 101 then '原作'
    when 102 then '导演'
    when 103 then '编剧'
    when 104 then '画师'
    when 105 then '游戏设计师'

    when 201 then '制作团队'
    when 202 then '连载平台'
    when 203 then '出版社'
    when 204 then '发行商'
    when 205 then '渠道商'
    when 206 then '播放电视台'

    else ''