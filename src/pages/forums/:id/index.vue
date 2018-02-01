<template lang="jade">
  #forum-detail
    action-bar(:forum="forum")
    post-list(:posts="posts")
    page-bar(:page="routePage", :size="size", :total="total" @change="changePage")
    post-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'page-bar':   require('components/@/page-bar')
      'post-modal': require('components/bbs/post-modal')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')

    props:
      'forum':
        type: Object
        required: true
      'posts':
        type: Array
        default: -> []
      'size':
        type: Number
        required: true
      'total':
        type: Number
        required: true

    methods:
      changePage: (page) ->
        @$router.push("##{page}")
</script>


<style lang="less" scoped>
  #forum-detail{
    margin: 0 auto;
    width: 800px;
    .page-bar{
      margin-top: 28px;
    }
  }
</style>