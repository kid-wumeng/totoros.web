exports.computed =
  loginUser: -> @$store.state.account.user
  login:     -> @loginUser isnt null
  admin:     -> @login and @loginUser.admin

  routePage: ->
    hash = @$route.hash
    if hash
      page = hash.slice(1)
      return parseInt(page)
    else
      return 1