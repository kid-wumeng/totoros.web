<template lang="jade">
  .panel
    .reference
      span.user @{{ referenceComment.user.name }}
      span.content {{ referenceContent }}
    input-content(v-model="content", :rows="10")
    row.-right
      c-button(@click="submit") 确认发布
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':      require('components/@/button')
      'input-content': require('components/@/input-content')

    computed:
      referenceComment: -> @state['reference-comment-modal'].referenceComment
      createMethod:     -> @state['reference-comment-modal'].createMethod
      atID:             -> @state['reference-comment-modal'].atID
      content:          -> @state['input-content'].content
      referenceContent: ->
        content = @referenceComment.content
        if(content.length > 100)
          return content.slice(0, 100) + '...'
        else
          return content

    methods:
      submit: ->
        try
          @model.assets.checkCommentContent(@content)

          method = "comment.#{@createMethod}"
          referenceCommentID = @referenceComment.id
          comment = await api.call(method, @atID, @content, referenceCommentID)

          @notify('done', '发布成功')
          @commit('CREATE_COMMENT', comment)

          @commit('reference-comment-modal/HIDE')
        catch error
          @notify('fail', error)
</script>


<style lang="less" scoped>
  .panel{
    width: 600px;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .reference{
      padding-top: 16px;
      padding-bottom: 16px;
      border-top: 1px solid #F2F2F2;
      border-bottom: 1px solid #F2F2F2;
      line-height: 19px;
      text-align: justify;
      .user{
        margin-right: 2px;
        font-weight: 600;
        font-size: 13px;
      }
      .content{
        font-size: 13px;
        color: #707C88;
      }
    }
  }
</style>