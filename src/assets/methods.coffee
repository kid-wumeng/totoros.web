exports.isMe = (user) ->
  return user?.id and user?.id is @loginUser?.id


exports.totoro = (message, duration) ->
  @dispatch('totoro/showMessage', {message, duration})


exports.notify = (type, message, duration) ->
  @dispatch('notify/show', {type, message, duration})


exports.prompt = (message, defaults) ->
  @dispatch('prompt/show', {message, defaults})


exports.dataUrl = (file, callback) ->
  reader = new FileReader()
  reader.readAsDataURL(file)
  reader.onload = (e) ->
    callback(e.target.result)


exports.toSubjectPage = (subject) ->
  @$router.push("/subjects/#{subject.id}")


exports.toRolePage = (role) ->
  @$router.push("/roles/#{role.id}")


exports.toPersonPage = (person) ->
  @$router.push("/persons/#{person.id}")


exports.toOrganizationPage = (organization) ->
  @$router.push("/organizations/#{organization.id}")