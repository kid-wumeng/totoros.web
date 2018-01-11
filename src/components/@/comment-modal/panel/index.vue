<template lang="jade">
  .panel
    input-content(v-model="content")
    row.-right
      c-button(@click="submit") 确认发布
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':      require('components/@/button')
      'input-content': require('components/@/input-content')

    data: ->
      id: @state['comment-modal'].comment?.id ? 0

    computed:
      content: -> @state['input-content'].content

    methods:
      submit: ->
        try
          @check()

          if(@id)
            comment = await api.call('comment.update', @id, @content)
            @notify('done', '修改成功')
            @commit('UPDATE_COMMENT', comment)
          # else
          #   comment = await api.call('comment.create', @forum.id, data)
          #   @notify('done', '发布成功')
          #   @commit('CREATE_COMMENT', comment)

          @commit('comment-modal/HIDE')
        catch error
          @notify('fail', error)

      check: ->
        @model.assets.checkCommentContent(@content)
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
  }
</style>