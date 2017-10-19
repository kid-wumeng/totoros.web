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

window.addEventListener 'unhandledrejection', (event) ->
  error = event.reason
  store.dispatch('notify/show', {type: 'fail', message: error.message, duration: 4000})

api.on('open', -> store.dispatch('account/checkin'))


window.Vue = Vue
window.model = model


##################################################
## 判断是否处于开发环境
##################################################
if process.env.NODE_ENV isnt 'production'
  window.dev = true


if dev
  window.cdn = 'http://oy0aiwj7c.bkt.clouddn.com'
else
  window.cdn = 'http://oy0az8u94.bkt.clouddn.com'


window.dpr = window.devicePixelRatio ? 1


window.sleep = (ms) ->
  return new Promise (resolve) ->
    setTimeout(resolve, ms)


Vue.use({
  install: (Vue) ->
    Vue.prototype.api        = api
    Vue.prototype.cdn        = cdn
    Vue.prototype.dpr        = dpr
    Vue.prototype.model      = model
    Vue.prototype.state      = store.state
    Vue.prototype.loginUser  = store.state.account.user
    Vue.prototype.commit     = store.commit
    Vue.prototype.dispatch   = store.dispatch
    Vue.prototype.isMe       = methods.isMe
    Vue.prototype.totoro     = methods.totoro
    Vue.prototype.toast      = methods.toast
    Vue.prototype.notify     = methods.notify
    Vue.prototype.prompt     = methods.prompt
    Vue.prototype.readDataUrl = methods.readDataUrl
    Vue.prototype.toUserPage         = methods.toUserPage
    Vue.prototype.toSubjectPage      = methods.toSubjectPage
    Vue.prototype.toRolePage         = methods.toRolePage
    Vue.prototype.toPersonPage       = methods.toPersonPage
    Vue.prototype.toOrganizationPage = methods.toOrganizationPage
    Vue.prototype.toForumPage        = methods.toForumPage
    Vue.prototype.toPostPage         = methods.toPostPage
    Vue.prototype.toPicturePage      = methods.toPicturePage
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

window.router = router


new Vue({
  el: '#app'
  store: store
  router: router
  render: (h) => h(App)
})
