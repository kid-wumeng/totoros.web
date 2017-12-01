exports.ANIME_TYPES = [
  'anime-tv'
  'anime-ova'
  'anime-web'
  'anime-movie'
  'anime-doujin'
  'anime-other'
]

exports.COMIC_TYPES = [
  'comic-long'
  'comic-short'
  'comic-paint'
  'comic-doujin'
  'comic-other'
]

exports.GAME_TYPES = [
  'game-official'
  'game-doujin'
  'game-other'
]

exports.NOVEL_TYPES = [
  'novel-long'
  'novel-short'
  'novel-doujin'
  'novel-other'
]


exports.STYLES         = [1..22]
exports.GAME_MODES     = [1..12]
exports.GAME_PLATFORMS = [1..30]


exports.unfoldType = (type) =>
  switch type
    when 'anime' then @ANIME_TYPES
    when 'comic' then @COMIC_TYPES
    when 'game'  then @GAME_TYPES
    when 'novel' then @NOVEL_TYPES
    else [type]


exports.isType = (type, mainType) =>
  if type is mainType
    return true
  else
    types = @unfoldType(mainType)
    return types.includes(type)


exports.displayKey = (key) =>
  switch key
    when 'face'          then '封面'
    when 'type'          then '类别'
    when 'name'          then '作品名'
    when 'nameOrigin'    then '原名'
    when 'nameAliases'   then '别名'
    when 'season'        then '季度'
    when 'intro'         then '简介'
    when 'publishDate'   then '发行日期'
    when 'styles'        then '风格'
    when 'gameModes'     then '游戏模式'
    when 'gamePlatforms' then '游戏平台'
    else ''


exports.displayType = (type) =>
  switch type
    when 'anime'         then '动画'
    when 'anime-tv'      then 'TV-Series'
    when 'anime-ova'     then 'OVA'
    when 'anime-web'     then 'WEB动画'
    when 'anime-movie'   then '剧场版'
    when 'anime-doujin'  then '同人动画'
    when 'anime-other'   then '其它动画'
    when 'comic'         then '漫画'
    when 'comic-long'    then '长篇漫画'
    when 'comic-short'   then '短篇漫画'
    when 'comic-paint'   then '画集'
    when 'comic-doujin'  then '同人漫画'
    when 'comic-other'   then '其它漫画'
    when 'game'          then '游戏'
    when 'game-official' then '游戏'
    when 'game-doujin'   then '同人游戏'
    when 'game-other'    then '其它游戏'
    when 'novel'         then '小说'
    when 'novel-long'    then '长篇小说'
    when 'novel-short'   then '短篇小说'
    when 'novel-doujin'  then '同人小说'
    when 'novel-other'   then '其它小说'
    else ''


exports.displayTypes = (type) =>
  switch type
    when 'anime'         then ['动画']
    when 'anime-tv'      then ['动画', 'TV']
    when 'anime-ova'     then ['动画', 'OVA']
    when 'anime-web'     then ['动画', 'Web']
    when 'anime-movie'   then ['动画', '剧场版']
    when 'anime-doujin'  then ['动画', '同人']
    when 'anime-other'   then ['动画', '其它']
    when 'comic'         then ['漫画']
    when 'comic-long'    then ['漫画', '长篇']
    when 'comic-short'   then ['漫画', '短篇']
    when 'comic-paint'   then ['漫画', '画集']
    when 'comic-doujin'  then ['漫画', '同人']
    when 'comic-other'   then ['漫画', '其它']
    when 'game'          then ['游戏']
    when 'game-official' then ['游戏', '发行版']
    when 'game-doujin'   then ['游戏', '同人']
    when 'game-other'    then ['游戏', '其它']
    when 'novel'         then ['小说']
    when 'novel-long'    then ['小说', '长篇']
    when 'novel-short'   then ['小说', '短篇']
    when 'novel-doujin'  then ['小说', '同人']
    when 'novel-other'   then ['小说', '其它']
    else []


exports.displayStyle = (style) =>
  switch parseInt(style)
    when 1  then '悬疑'
    when 2  then '科幻'
    when 3  then '魔幻'
    when 4  then '仙幻'
    when 5  then '历史'
    when 6  then '战斗'
    when 7  then '冒险'
    when 8  then '生存'
    when 9  then '斗智'
    when 10 then '体育'
    when 11 then '恋爱'
    when 12 then '青春'
    when 13 then '文化'
    when 14 then '搞笑'
    when 15 then '职场'
    when 16 then '恐怖'
    when 17 then '军事'
    when 18 then '耽美'
    when 19 then '百合'
    when 20 then '情色'
    when 21 then '社会'
    when 22 then '推理'
    else ''


exports.displayGameMode = (gameMode) =>
  switch parseInt(gameMode)
    when 1  then '角色扮演'
    when 2  then '即时战略'
    when 3  then '文字冒险'
    when 4  then '动作冒险'
    when 5  then '射击'
    when 6  then '格斗'
    when 7  then '战棋'
    when 8  then '模拟'
    when 9  then '体育'
    when 10 then '音乐'
    when 11 then '恋爱养成'
    when 12 then '益智'
    else ''


exports.displayGamePlatform = (gamePlatform) =>
  switch parseInt(gamePlatform)
    when 1  then 'PC'
    when 2  then 'Mac'
    when 3  then 'iPhone'
    when 4  then 'iPad'
    when 5  then 'Android'
    when 6  then 'PS'
    when 7  then 'PS2'
    when 8  then 'PS3'
    when 9  then 'PS4'
    when 10 then 'Xbox'
    when 11 then 'Xbox 360'
    when 12 then 'Xbox One'
    when 13 then 'Wii'
    when 14 then 'Wii U'
    when 15 then 'GB'
    when 16 then 'GBA'
    when 17 then 'DS'
    when 18 then '3DS'
    when 19 then 'PSP'
    when 20 then 'PSV'
    when 21 then 'FC'
    when 22 then 'SFC'
    when 23 then 'MD'
    when 24 then 'SS'
    when 25 then 'DC'
    when 26 then 'N64'
    when 27 then 'NGC'
    when 28 then 'Nintendo Switch'
    when 29 then '街机'
    when 30 then '桌游'
    else ''


exports.markStat = (subject, status) ->
  if !status
    count = 0
    count += @markStat(subject, 'will-do')
    count += @markStat(subject, 'doing')
    count += @markStat(subject, 'done')
    count += @markStat(subject, 'do-not')
    return count

  switch status
    when 'will-do' then subject.markStat?['will-do'] ? 0
    when 'doing'   then subject.markStat?['doing']   ? 0
    when 'done'    then subject.markStat?['done']    ? 0
    when 'do-not'  then subject.markStat?['do-not']  ? 0