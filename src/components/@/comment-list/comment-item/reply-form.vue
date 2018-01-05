<template lang="jade">
  column.reply-form(v-if="login")
    .label(@click="open=!open") {{ open ? '- 收起' : '+ 评论' }}
    input-area(v-if="open", v-model="content", autofocus, :rows="3")
    c-button(v-if="open" @click="submit") 确认发布
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-area': require('components/@/input-area')
      'c-button':   require('components/@/button')

    props:
      'comment':
        type: Object
        required: true

    data: ->
      open: false
      content: ''

    methods:
      submit: ->
        reply = await @api.call('comment.addReply', @comment.id, @content)
        @commit('ADD_COMMENT_REPLY', {
          comment: @comment,
          reply: reply
        })
        @open = false
</script>


<style lang="less" scoped>
  .reply-form{
    margin-top: 12px;
    margin-left: 14px;
    .label{
      align-self: flex-start;
      font-weight: 600;
      font-size: 12px;
      color: #A2AEBA;
      user-select: none;
      &:hover{
        cursor: pointer;
      }
    }
    .input-area{
      width: 60%;
      margin-top: 6px;
    }
    .button{
      margin-top: 8px;
      align-self: flex-start;
    }
  }
</style>