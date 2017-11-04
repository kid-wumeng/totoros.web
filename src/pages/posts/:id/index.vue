<template lang="jade">
  #posts-id(v-if="post")
    row
      .left
        breadcrumb(:post="post")
        c-main(:post="post")
        comment-list(:post="post")
        comment-form(:post="post")
      .right
        h1 这是侧栏
</template>


<script lang="coffee">
  module.exports =
    components:
      'breadcrumb':   require('./breadcrumb')
      'c-main':       require('./main')
      'comment-list': require('./comment-list')
      'comment-form': require('./comment-form')

    data: ->
      post: null

    methods:
      init: ->
        @post = await api.call('post.get', @routeID)
</script>


<style lang="less" scoped>
  #posts-id{
    background-color: #FFF;
    overflow: hidden;
    .left{
      margin: 20px auto;
      width: 660px;
      >*{
        margin-bottom: 20px;
      }
    }
    .right{
      width: 200px;
    }
  }
</style>
