exports.listen = (event, callback) ->
  @commit('bus/ADD_EVENT_LISTENER', {event, callback})


exports.isSame = (model1, model2) ->
  id1 = model1?.id
  id2 = model2?.id
  isNumber1 = typeof(id1) is 'number'
  isNumber2 = typeof(id2) is 'number'
  return isNumber1 and isNumber2 and id1 is id2


exports.isMe = (user) ->
  return @isSame(user, @loginUser)


exports.updateItem = (models, update_model) ->
  for model, i in models
    if isSame(model, update_model)
      Vue.set(models, i, update_model)
      return true
  return false


exports.removeItem = (models, remove_model) ->
  for model, i in models
    if isSame(model, remove_model)
      models.splice(i, 1)
      return true
  return false


exports.update = (models, update_model) ->
  for model, i in models
    if isSame(model, update_model)
      Vue.set(models, i, update_model)
      return true
  return false


exports.remove = (models, remove_model) ->
  for model, i in models
    if isSame(model, remove_model)
      models.splice(i, 1)
      return true
  return false


exports.inc = (data, key, n=1) ->
  value = data[key] ? 0
  Vue.set(data, key, value + n)


exports.dec = (data, key, n=1) ->
  value = data[key] ? 0
  Vue.set(data, key, value - n)


exports.omit = (models, omit_model) ->
  return models.filter (model) -> model.id isnt omit_model.id


exports.totoro = (message, duration) ->
  @dispatch('totoro/showMessage', {message, duration})


exports.toast = (message, duration) ->
  @dispatch('toast/show', {message, duration})


exports.notify = (type, message, duration) ->
  @dispatch('notify/show', {type, message, duration})


exports.confirm = (message) ->
  @dispatch('confirm/show', {message})


exports.prompt = (message, defaults) ->
  @dispatch('prompt/show', {message, defaults})


exports.readDataUrl = (file, callback) ->
  reader = new FileReader()
  reader.readAsDataURL(file)
  reader.onload = (e) ->
    callback(e.target.result)


exports.toSubjectPage = (subject, subPath='') ->
  path = "/subjects/#{subject.id}/#{subPath}"
  path = path.replace(/\/$/, '')
  @$router.push(path)


exports.replaceSubjectPage = (subject, subPath='') ->
  path = "/subjects/#{subject.id}/#{subPath}"
  path = path.replace(/\/$/, '')
  @$router.replace(path)


exports.toUserPage = (user, subPath='') ->
  path = "/users/#{user.id}/#{subPath}"
  path = path.replace(/\/$/, '')
  @$router.push(path)


exports.replaceUserPage = (user, subPath='') ->
  path = "/users/#{user.id}/#{subPath}"
  path = path.replace(/\/$/, '')
  @$router.replace(path)


exports.toRolePage = (role) ->
  @$router.push("/roles/#{role.id}")


exports.replaceRolePage = (role) ->
  @$router.replace("/roles/#{role.id}")


exports.toPersonPage = (person) ->
  @$router.push("/persons/#{person.id}")


exports.replacePersonPage = (person) ->
  @$router.replace("/persons/#{person.id}")


exports.toOrganizationPage = (organization) ->
  @$router.push("/organizations/#{organization.id}")


exports.replaceOrganizationPage = (organization) ->
  @$router.replace("/organizations/#{organization.id}")


exports.toClubPage = (club) ->
  @$router.push("/clubs/#{club.id}")


exports.toPostPage = (post) ->
  @$router.push("/posts/#{post.id}")


exports.toPicturePage = (picture) ->
  @$router.push("/pictures/#{picture.id}")