<template lang="jade">
  .comment-item(:id="id")
    floor(
      :user="comment.user",
      :content="comment.content",
      :date="comment.createDate",
      :floor="floor",
      :reference="comment.referenceComment",
      show-edit
      @update="update"
      @reference="reference"
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components/@/floor')
      # 'reply-form': require('./reply-form')
      # 'reply-list': require('./reply-list')

    props:
      'comment':
        type: Object
        required: true

    computed:
      floor: ->
        if(@comment.floor)
          return "##{@comment.floor}"
        else
          return ''

      id: -> "comment-id-#{@comment.id}"

    methods:
      update: ->
        @dispatch('comment-modal/show', {comment: @comment})

      reference: ->
        @$emit('reference')
</script>


<style lang="less" scoped>
  .comment-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
  }
</style>