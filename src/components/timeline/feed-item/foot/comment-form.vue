<template lang="jade">
  .comment-form.row
    c-input(v-model="content", placeholder="说点什么..." autofocus @submit="submit")
    c-button(@click="submit") SUBMIT
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    props:
      'feed':
        type: Object
        required: true

    data: ->
      content: ''

    methods:
      submit: ->
        try
          @check()
          comment = await api.call('feed.addComment', @feed.id, @content)
          @done(comment)
        catch error
          @notify('fail', error)

      check: ->
        @model.assets.checkCommentContent(@content)

      done: (comment) ->
        @commit('ADD_FEED_COMMENT', {feed: @feed, comment})
        @content = ''
        @$emit('add-done')
</script>


<style lang="less" scoped>
  .comment-form{
    .input{
      flex: auto;
      &::placeholder{
        font-size: 13px;
      }
    }
    .button{
      margin-left: 10px;
      font-size: 13px;
    }
  }
</style>