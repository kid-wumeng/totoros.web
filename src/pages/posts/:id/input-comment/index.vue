<template lang="jade">
  .input-comment(v-if="login")
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
          @api.call('post.addComment', @post.id, @content).done(@done)
        catch error
          @notify('fail', error)

      check: ->
        @model.assets.checkCommentContent(@content)

      done: (comment) ->
        @notify('done', '发布成功')
        @commit('ADD_POST_COMMENT', {post: @post, comment})
        @content = ''
</script>


<style lang="less" scoped>
  .input-comment{
    padding: 12px;
    border: 1px solid #FFF;
    border-radius: 3px;
    box-shadow: 0 0 6px -3px #000;
    .button{
      margin-top: 12px;
    }
  }
</style>
