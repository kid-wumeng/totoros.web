<template lang="jade">
  .comment-item
    floor(
      :user="comment.user",
      :content="comment.content",
      :date="comment.createDate",
      :floor="floor",
      :reference="comment.referenceComment",
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components.h5/floor')

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
</script>


<style lang="less" scoped>
  .comment-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    &:last-child .floor{
      margin-bottom: 0;
    }
  }
</style>