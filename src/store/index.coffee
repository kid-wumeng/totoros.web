Vue  = require('vue').default
Vuex = require('vuex')

Vue.use(Vuex)

module.exports = new Vuex.Store({
  strict: process.env.NODE_ENV isnt 'production'
  modules:
    'router':  require('./router')
    'admin-forums': require('./admin-forums')
    'account': require('./account')
    'totoro':  require('./totoro')
    'toast':   require('./toast')
    'notify':  require('./notify')
    'prompt':  require('./prompt')
    'public-timeline': require('./public-timeline')

    'search-modal': require('./search-modal')

    'subject-detail':    require('./subject-detail')
    'role-detail':         require('./role-detail')
    'person-detail':       require('./person-detail')
    'organization-detail': require('./organization-detail')
    'post-list':         require('./post-list')
    'post-detail':       require('./post-detail')
    'user-detail':       require('./user-detail')

    'mark-modal':        require('./mark-modal')
    'post-modal':        require('./post-modal')
    'user-face-modal':   require('./user-face-modal')
    'user-banner-modal': require('./user-banner-modal')
    'input-content':     require('./input-content')

    'create-forum-modal':           require('./create-forum-modal')
    'create-subject-modal':         require('./create-subject-modal')
    'create-role-modal':            require('./create-role-modal')
    'create-person-modal':          require('./create-person-modal')
    'create-organization-modal':    require('./create-organization-modal')
    'update-forum-modal':           require('./update-forum-modal')
    'edit-subject-base-modal':      require('./edit-subject-base-modal')
    'edit-role-base-modal':         require('./edit-role-base-modal')
    'edit-person-base-modal':       require('./edit-person-base-modal')
    'edit-organization-base-modal': require('./edit-organization-base-modal')
    'wiki-face-modal':       require('./wiki-face-modal')
})