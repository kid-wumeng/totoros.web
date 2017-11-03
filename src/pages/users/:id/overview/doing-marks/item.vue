<template lang="jade">
  row.item
    .left
      subject-face(:subject="mark.subject" frame)
    .right
      .name {{ mark.subject.name }}
      mark-progress(:mark="mark")
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face':  require('components/image/subject-face')
      'mark-progress': require('components/user/mark-progress')

    props:
      'mark':
        type: Object
        required: true

    computed:
      desc: ->
        type   = @model.subject.displayType(@mark.subject?.type)
        season = @mark.subject?.season
        desc = type
        if(season)
          desc += " / Season #{season}"
        return desc
</script>


<style lang="less" scoped>
  .item{
    >.left{
      flex: none;
    }
    >.right{
      flex: auto;
      margin-left: 8px;
    }
    .subject-face{
      width: 54px;
    }
    .name{
      display: inline;
      font-weight: 600;
      font-size: 13px;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .desc{
      margin-top: 2px;
      margin-left: 1px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .mark-progress{
      margin-top: 6px;
    }
  }
</style>