Vue        = require('vue').default
Router     = require('vue-router').default
Lazyload   = require('vue-lazyload')
Sai        = require('./assets/sai.io')
store      = require('./store')
model      = require('./model')
App        = require('./App')
methods    = require('./assets/methods')
directives = require('./assets/directives')
mixins     = require('./assets/mixins')
routes     = require('./assets/routes')


window.api = new Sai.RemoteApp('ws://127.0.0.1:3000')

api.fail (error) ->
  store.dispatch('notify/show', {type: 'fail', message: error.message})

api.on('open', -> store.dispatch('account/checkin'))




##################################################
## 判断是否处于开发环境
##################################################
if process.env.NODE_ENV isnt 'production'
  window.dev = true



Vue.use({
  install: (Vue) ->
    Vue.prototype.model     = model
    Vue.prototype.state     = store.state
    Vue.prototype.loginUser = store.state.account.user
    Vue.prototype.commit    = store.commit
    Vue.prototype.dispatch  = store.dispatch
    Vue.prototype.isMe      = methods.isMe
    Vue.prototype.totoro    = methods.totoro
    Vue.prototype.notify    = methods.notify
    Vue.directive('focus', directives.focus)
    Vue.mixin({computed: mixins.computed})
})


Vue.use(Lazyload)


Vue.use(Router)
router = new Router({
  mode: 'history'
  routes: routes
  scrollBehavior: (to, from, savedPosition) -> savedPosition ? {x: 0, y: 0}
})


new Vue({
  el: '#app'
  store: store
  router: router
  render: (h) => h(App)
})
