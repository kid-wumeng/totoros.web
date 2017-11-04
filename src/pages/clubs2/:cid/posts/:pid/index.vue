<template lang="jade">
  #posts-detail(v-if="post")
    breadcrumb(:post="post")
    c-main(:post="post")
    comment-list(:post="post")
    comment-form(:post="post")
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

    computed:
      id: -> parseInt(@$route.params.pid)

    watch:
      id: -> @init()

    methods:
      init: ->
        @post = await api.call('post.get', @id)
</script>


<style lang="less" scoped>
  #posts-detail{
    width: 600px;
  }
</style>
