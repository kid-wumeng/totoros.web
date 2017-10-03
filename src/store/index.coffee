Vue  = require('vue').default
Vuex = require('vuex')

Vue.use(Vuex)

module.exports = new Vuex.Store({
  strict: process.env.NODE_ENV isnt 'production'
  modules:
    'account': require('./account')
    'totoro':  require('./totoro')
    'notify':  require('./notify')
    'prompt':  require('./prompt')
    'submit-subject-modal':    require('./submit-subject-modal')
    'edit-subject-base-modal': require('./edit-subject-base-modal')
})