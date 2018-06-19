import Vue from 'vue'


Vue.prototype.io =
   cdn:   require('~/plugins/io/cdn')
   dev:   require('~/plugins/io/dev')
   sleep: require('~/plugins/io/sleep')