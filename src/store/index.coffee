Vue  = require('vue').default
Vuex = require('vuex')

Vue.use(Vuex)

module.exports = new Vuex.Store({
  strict: process.env.NODE_ENV isnt 'production'
  modules:
    'account': require('./account')
    'totoro':  require('./totoro')
    'toast':   require('./toast')
    'notify':  require('./notify')
    'prompt':  require('./prompt')
    
    'subject-list': require('./subject-list')
    'mark-list':    require('./mark-list')

    'mark-modal':                   require('./mark-modal')
    'create-subject-modal':         require('./create-subject-modal')
    'create-role-modal':            require('./create-role-modal')
    'create-person-modal':          require('./create-person-modal')
    'create-organization-modal':    require('./create-organization-modal')
    'edit-subject-base-modal':      require('./edit-subject-base-modal')
    'edit-role-base-modal':         require('./edit-role-base-modal')
    'edit-person-base-modal':       require('./edit-person-base-modal')
    'edit-organization-base-modal': require('./edit-organization-base-modal')
    'upload-wiki-face-modal':       require('./upload-wiki-face-modal')
})