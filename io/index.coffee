import Vue from 'vue'


io =
   cdn:               require('./cdn')
   dev:               require('./dev')
   dpr:               require('./dpr')
   formatDate:        require('./formatDate')
   formatDateAgo:     require('./formatDateAgo')
   formatMarkStep:    require('./formatMarkStep')
   formatScore:       require('./formatScore')
   formatSubjectType: require('./formatSubjectType')
   formatSubjectWay:  require('./formatSubjectWay')
   isID:              require('./isID')
   resize:            require('./resize')
   sleep:             require('./sleep')


if process.browser
   window.io = io
else
   global.io = io


Vue.prototype.io = io