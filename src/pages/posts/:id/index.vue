<template lang="jade">
  #posts-id(v-if="post")
    .wrap
      .title {{ post.title }}
      markdown-area(:content="post.content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'markdown-area': require('components/@/markdown-area')

    computed:
      id:   -> parseInt(@$route.params.id)
      post: -> @state['post-detail'].post

    created: ->
      @dispatch('post-detail/load', @id)
</script>


<style lang="less" scoped>
  #posts-id{
    background-color: #273340;
    .wrap{
      margin: 20px auto;
      padding: 14px;
      width: 700px;
      background-color: #FFF;
      border-radius: 3px;
      box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.1);
      .title{
        font-weight: 600;
        font-size: 16px;
        color: #273340;
        margin-bottom: 14px;
      }
    }
  }
</style>
