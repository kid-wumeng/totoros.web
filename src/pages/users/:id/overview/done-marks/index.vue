<template lang="jade">
  .done-marks
    mark-gallery(label="动画", :marks="anime_marks")
    mark-gallery(label="漫画", :marks="comic_marks")
    mark-gallery(label="游戏", :marks="game_marks")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-gallery': require('./mark-gallery')

    props:
      'user':
        type: Object
        required: true

    computed:
      anime_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'anime')
        return marks.slice(0, 7)

      comic_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'comic')
        return marks.slice(0, 7)

      game_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'game')
        return marks.slice(0, 7)
</script>


<style lang="less" scoped>
  .done-marks{
    .mark-gallery{
      margin-bottom: 24px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>