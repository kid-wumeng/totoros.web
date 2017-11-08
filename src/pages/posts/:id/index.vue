<template lang="jade">
  #posts-id(v-if="post")
    .wrap1
      breadcrumb(:post="post")
      c-header(:post="post")
      c-content(:post="post")
    .wrap2
      comment-list(:post="post")
      comment-form(:post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'breadcrumb':   require('./breadcrumb')
      'c-header':     require('./header')
      'c-content':    require('./content')
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
    overflow: hidden;
    box-sizing: border-box;
    background-color: #FFF;
    .wrap1{
      margin: 28px auto;
      width: 660px;
      >*{
        margin-bottom: 24px;
      }
    }
    .wrap2{
      margin: 0 auto;
      width: 800px;
      >*{
        margin-bottom: 24px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>
