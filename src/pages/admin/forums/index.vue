<template lang="jade">
  #admin-forums
    action-bar
    forum-list

    create-forum-modal
    update-forum-modal
    forum-managers-modal
    forum-face-modal
    forum-banner-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-bar':           require('./action-bar')
      'forum-list':           require('./forum-list')
      'create-forum-modal':   require('components/bbs/create-forum-modal')
      'update-forum-modal':   require('components/bbs/update-forum-modal')
      'forum-managers-modal': require('components/bbs/forum-managers-modal')
      'forum-face-modal':     require('components/bbs/forum-face-modal')
      'forum-banner-modal':   require('components/bbs/forum-banner-modal')

    created: ->
      @init()

    methods:
      init: ->
        @dispatch('admin-forums/init')
</script>


<style lang="less" scoped>
  #admin-forums{
  }
</style>
