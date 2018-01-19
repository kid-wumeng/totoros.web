<template lang="jade">
  .animes
    detail-area(:title="title")
      grid
        subject-face(v-for="mark in marks", :key="mark.id", :subject="mark.subject" fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components.h5/detail-area')
      'grid':         require('components/@/grid')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "标记了 #{@model.user.markStat(@user, null, 'anime')} 部动画"

      marks: ->
        marks = @user.marks ? []
        marks = marks.filter (mark) =>
          @model.subject.isType(mark.subject.type, 'anime')
        return marks.slice(0, 16)
</script>


<style lang="less" scoped>
  .animes{
    .grid{
      margin-top: 12px;
    }
    .subject-face{
      width: 25%;
    }
  }
</style>