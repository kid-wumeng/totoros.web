<template lang="jade">
  .panel
    h1 将这个帖子移动到：
    radio-bar(:value="targetForumID" @change="change")
      radio(v-for="forum in forums", :key="forum.id", :label="forum.name", :value="forum.id")
    c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar': require('components/@/radio-bar')
      'radio':     require('components/@/radio')
      'c-button':  require('components/@/button')

    data: ->
      targetForumID: 0

    computed:
      forums: -> @state['move-post-modal'].forums
      post:   -> @state['move-post-modal'].post

    methods:
      change: (forumID) ->
        @targetForumID = forumID

      submit: ->
        try
          @check()
          post = await @api.call('post.updateForum', @post.id, @targetForumID)
          @done(post)
        catch error
          @notify('fail', error)

      check: ->
        if(!@targetForumID)
          throw '请选择目标版块 ~'

      done: (post) ->
        @notify('done', '帖子移动成功 ~')
        @commit('UPDATE_POST_FORUM', post)
        @commit('move-post-modal/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    width: 300px;
    >*{
      margin-bottom: 12px;
    }
    h1{
      text-align: center;
    }
    .button{
      display: block;
    }
  }
</style>
