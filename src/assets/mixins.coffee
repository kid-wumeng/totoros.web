exports.computed =
  loginUser: -> @$store.state.account.user
  login:     -> @$store.state.account.user isnt null
  admin:     -> @$store.state.account.user and @$store.state.account.user.admin

  routeID: ->
    if @$route.params.id
      return parseInt(@$route.params.id)
    else
      return 0

  routePage: ->
    hash = @$route.hash
    if hash
      page = hash.slice(1)
      return parseInt(page)
    else
      return 1