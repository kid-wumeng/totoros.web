Vue        = require('vue').default
Router     = require('vue-router').default
Sai        = require('./assets/sai.io')
store      = require('./store')
model      = require('./model')
App        = require('./App')
methods    = require('./assets/methods')
directives = require('./assets/directives')
routes     = require('./assets/routes')


window.api = new Sai.RemoteApp('ws://127.0.0.1:3000')

api.fail (error) ->
  store.dispatch('notify/show', {type: 'fail', message: error.message})

api.on('open', -> store.dispatch('checkin'))




##################################################
## 判断是否处于开发环境
##################################################
if process.env.NODE_ENV isnt 'production'
  window.dev = true



##################################################
## 设置 CDN 地址
##################################################
if window.dev
  window.cdn = "http://omdg5dewm.bkt.clouddn.com"
else
  window.cdn = "http://cdn.orz-world.com"



Vue.use({
  install: (Vue) ->
    Vue.prototype.model    = model
    Vue.prototype.state    = store.state
    Vue.prototype.commit   = store.commit
    Vue.prototype.dispatch = store.dispatch
    Vue.prototype.api      = api
    Vue.prototype.cdn      = methods.cdn
    Vue.prototype.url      = methods.url
    Vue.prototype.totoro   = methods.totoro
    Vue.prototype.notify   = methods.notify
    Vue.directive('focus', directives.focus)
})


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
