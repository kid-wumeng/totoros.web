exports.isMe = (user) ->
  return user?.id and user?.id is @loginUser?.id


exports.totoro = (message, duration) ->
  @dispatch('totoro/showMessage', {message, duration})


exports.notify = (type, message, duration) ->
  @dispatch('notify/show', {type, message, duration})


exports.prompt = (message, defaults) ->
  @dispatch('prompt/show', {message, defaults})