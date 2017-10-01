exports.cdn = (path) ->
  return "#{window.cdn}/#{path}"


exports.totoro = (message, duration) ->
  @dispatch('totoro/showMessage', { message, duration })


exports.notify = (type, message, duration) ->
  @dispatch('notify/show', { type, message, duration })


exports.toTimelinePage = ->
  @$router.push('/')