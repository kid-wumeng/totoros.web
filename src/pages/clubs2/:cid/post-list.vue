<template lang="jade">
  post-list(:posts="posts")
</template>


<script lang="coffee">
  module.exports =
    components:
      'post-list': require('components/bbs/post-list')

    props:
      'club':
        type: Object

    data: ->
      posts: []
      total: 0

    methods:
      init: ->
        if @club
          query = {cid: @club.id}
        else
          query = {}
        result = await @api.call('post.getAll', query)
        @posts = result.posts
        @total = result.total
</script>


<style lang="less" scoped>
  .post-list{
    @padding: 12px;
    @border: 1px solid #F2F2F2;
    .post-item{
      margin-bottom:  @padding;
      border-bottom:  @border;
      padding-bottom: @padding + 1;
      &:first-child{
        margin-top:  @padding + 1;
        border-top:  @border;
        padding-top: @padding;
      }
    }
  }
</style>