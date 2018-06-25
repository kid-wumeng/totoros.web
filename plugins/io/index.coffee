import Vue from 'vue'


io =
   cdn:               require('./cdn')
   dev:               require('./dev')
   dpr:               require('./dpr')
   formatScore:       require('./formatScore')
   formatSubjectType: require('./formatSubjectType')
   formatSubjectWay:  require('./formatSubjectWay')
   isID:              require('./isID')
   sleep:             require('./sleep')


if process.browser
   window.io = io
else
   global.io = io


Vue.prototype.io = io