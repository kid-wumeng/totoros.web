exports.computed =
  loginUser: -> @$store.state.account.user
  login:     -> @$store.state.account.user isnt null
  admin:     -> @$store.state.account.user and @$store.state.account.user.admin

  routePage: ->
    hash = @$route.hash
    if hash
      page = hash.slice(1)
      return parseInt(page)
    else
      return 1