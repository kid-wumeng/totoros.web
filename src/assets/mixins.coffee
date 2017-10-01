exports.computed =
  login:     -> @$store.state.account.user isnt null
  loginUser: -> @$store.state.account.user