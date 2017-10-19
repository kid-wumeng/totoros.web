module.exports = install: (Vue) -> Vue.mixin({

  computed:
    loginUser: -> @$store.state.account.user
    login:     -> @$store.state.account.user isnt null
    admin:     -> @$store.state.account.user and @$store.state.account.user.admin
    routeID:   -> parseInt(@$route.params.id ? 0)

    routePage: ->
      hash = @$route.hash
      if hash
        page = hash.slice(1)
        return parseInt(page)
      else
        return 1
})