exports.isMe = (user) ->
  return user?.id and user?.id is @loginUser?.id


exports.totoro = (message, duration) ->
  @dispatch('totoro/showMessage', {message, duration})


exports.toast = (message, duration) ->
  @dispatch('show-toast', {message, duration})


exports.notify = (type, message, duration) ->
  @dispatch('notify/show', {type, message, duration})


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



exports.toRolePage = (role) ->
  @$router.push("/roles/#{role.id}")


exports.toPersonPage = (person) ->
  @$router.push("/persons/#{person.id}")


exports.toOrganizationPage = (organization) ->
  @$router.push("/organizations/#{organization.id}")


exports.toPostPage = (post) ->
  @$router.push("/posts/#{post.id}")


exports.toPicturePage = (picture) ->
  @$router.push("/pictures/#{picture.id}")