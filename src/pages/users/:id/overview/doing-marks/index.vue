<template lang="jade">
  .doing-marks
    detail-box(v-if="anime_marks.length", title="Watching Animes")
      item(v-for="mark in anime_marks", :key="mark.id", :mark="mark")

    detail-box(v-if="comic_marks.length", title="Reading Comics")
      item(v-for="mark in comic_marks", :key="mark.id", :mark="mark")

    detail-box(v-if="game_marks.length", title="Playing Games")
      item(v-for="mark in game_marks",  :key="mark.id", :mark="mark")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/user/detail-box')
      'item':       require('./item')

    props:
      'user':
        type: Object
        required: true

    computed:
      anime_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'doing' and @model.subject.isType(mark.subject.type, 'anime')
        return marks.slice(0, 5)

      comic_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'doing' and @model.subject.isType(mark.subject.type, 'comic')
        return marks.slice(0, 5)

      game_marks: ->
        marks = @user.marks.filter (mark) =>
          mark.status is 'doing' and @model.subject.isType(mark.subject.type, 'game')
        return marks.slice(0, 5)
</script>


<style lang="less" scoped>
  .doing-marks{
    .detail-box{
      margin-bottom: 24px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .item{
      margin-bottom: 12px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>