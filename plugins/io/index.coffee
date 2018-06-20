import Vue from 'vue'


Vue.prototype.io =
   cdn:   require('./cdn')
   dev:   require('./dev')
   sleep: require('./sleep')