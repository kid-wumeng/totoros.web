<template lang="jade">
  .games
    detail-area(:title="title")
      grid
        subject-face(v-for="mark in marks", :key="mark.id", :subject="mark.subject" fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/user/detail-area')
      'grid':         require('components/@/grid')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "标记了 #{@model.user.markStat(@user, null, 'game')} 部游戏"

      marks: ->
        marks = @user.marks ? []
        marks = marks.filter (mark) =>
          @model.subject.isType(mark.subject.type, 'game')
        return marks.slice(0, 21)
</script>


<style lang="less" scoped>
  .games{
    .subject-face{
      width: 14.28%;
    }
  }
</style>