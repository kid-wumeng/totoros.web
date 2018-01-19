<template lang="jade">
  #posts-id(v-if="post")
    c-header(:post="post")
    c-content(:post="post")
    comment-list(:post="post")
    //- relative-wiki(:post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header':      require('./header')
      'c-content':     require('./content')
      'comment-list':  require('./comment-list')
      'relative-wiki': require('./relative-wiki')

    data: ->
      post: null

    metaInfo: ->
      title: if @post then @post.title else ''

    activated: ->
      @init()

    methods:
      init: ->
        @post = await api.call('post.get', @routeID)
</script>


<style lang="less" scoped>
  #posts-id{
  }
</style>
