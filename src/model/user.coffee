assets = require('./assets')


exports.markStat = (user, status, type) ->
  if !status
    count = 0
    count += @markStat(user, 'will-do', type)
    count += @markStat(user, 'doing', type)
    count += @markStat(user, 'done', type)
    count += @markStat(user, 'do-not', type)
    return count

  switch status
    when 'will-do' then stat = user.markStat?['will-do']
    when 'doing'   then stat = user.markStat?['doing']
    when 'done'    then stat = user.markStat?['done']
    when 'do-not'  then stat = user.markStat?['do-not']

  switch type
    when 'anime-tv'     then stat?['anime-tv']     ? 0
    when 'anime-ova'    then stat?['anime-ova']    ? 0
    when 'anime-web'    then stat?['anime-web']    ? 0
    when 'anime-movie'  then stat?['anime-movie']  ? 0
    when 'anime-doujin' then stat?['anime-doujin'] ? 0
    when 'anime-other'  then stat?['anime-other']  ? 0

    when 'comic-long'   then stat?['comic-long']   ? 0
    when 'comic-short'  then stat?['comic-short']  ? 0
    when 'comic-paint'  then stat?['comic-paint']  ? 0
    when 'comic-doujin' then stat?['comic-doujin'] ? 0
    when 'comic-other'  then stat?['comic-other']  ? 0

    when 'game-official' then stat?['game-official'] ? 0
    when 'game-doujin'   then stat?['game-doujin']   ? 0
    when 'game-other'    then stat?['game-other']    ? 0

    when 'novel-long'   then stat?['novel-long']   ? 0
    when 'novel-short'  then stat?['novel-short']  ? 0
    when 'novel-doujin' then stat?['novel-doujin'] ? 0
    when 'novel-other'  then stat?['novel-other']  ? 0

    when 'anime'
      count = 0
      count += stat?['anime-tv']     ? 0
      count += stat?['anime-ova']    ? 0
      count += stat?['anime-web']    ? 0
      count += stat?['anime-movie']  ? 0
      count += stat?['anime-doujin'] ? 0
      count += stat?['anime-other']  ? 0
      return count

    when 'comic'
      count = 0
      count += stat?['comic-long']   ? 0
      count += stat?['comic-short']  ? 0
      count += stat?['comic-paint']  ? 0
      count += stat?['comic-doujin'] ? 0
      count += stat?['comic-other']  ? 0
      return count

    when 'game'
      count = 0
      count += stat?['game-official'] ? 0
      count += stat?['game-doujin']   ? 0
      count += stat?['game-other']    ? 0
      return count

    when 'novel'
      count = 0
      count += stat?['novel-long']   ? 0
      count += stat?['novel-short']  ? 0
      count += stat?['novel-doujin'] ? 0
      count += stat?['novel-other']  ? 0
      return count

    else
      count = 0
      count += @markStat(user, 'anime', status)
      count += @markStat(user, 'comic', status)
      count += @markStat(user, 'game', status)
      count += @markStat(user, 'novel', status)
      return count