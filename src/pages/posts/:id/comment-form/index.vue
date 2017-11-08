<template lang="jade">
  .comment-form(v-if="login")
    input-area(v-model="content" placeholder="说几句吧~", :rows="6")
    c-button(@click="submit") 发表回复
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-area': require('components/@/input-area')
      'c-button':   require('components/@/button')

    props:
      'post':
        type: Object
        required: true

    data: ->
      content: ''

    methods:
      submit: ->
        try
          @check()
          comment = await @api.call('comment.createAtPost', @post.id, @content)
          @done(comment)
        catch error
          @notify('fail', error)

      check: ->
        @model.assets.checkCommentContent(@content)

      done: (comment) ->
        @notify('done', '发布成功')
        @commit('CREATE_COMMENT', comment)
        @content = ''
</script>


<style lang="less" scoped>
  .comment-form{
    .button{
      margin-top: 12px;
    }
  }
</style>
