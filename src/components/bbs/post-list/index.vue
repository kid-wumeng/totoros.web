<template lang="jade">
  .post-list
    post-item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'post-item': require('components/bbs/post-item')

    props:
      'id':
        type: Number
        required: true

    computed:
      posts: -> @state['post-list'].posts
      total: -> @state['post-list'].total

    created: ->
      @load()

    methods:
      load: ->
        @dispatch('post-list/load', @id)
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