<template lang="jade">
  row.subject-card(@click="toSubjectPage(subject)")
    .left
      subject-face(:subject="subject" frame)
    .right
      .name {{ subject.name }}
      .desc {{ desc }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face': require('components/image/subject-face')

    props:
      'subject':
        type: Object
        required: true

    computed:
      type:   -> @model.subject.displayType(@subject.type)
      season: ->
        if(@subject.season)
          return "Season #{@subject.season}"
        else
          return ''
      desc:   ->
        desc = [@type, @season].filter (item) -> item
        return desc.join(' / ')
</script>


<style lang="less" scoped>
  .subject-card{
    padding: 12px;
    cursor: pointer;
    &:nth-child(odd){
      background-color: rgb(249, 249, 249);
    }
    .left{
      .subject-face{
        width: 40px;
      }
    }
    .right{
      margin-left: 7px;
      margin-top: -2px;
      .name{
        line-height: 18px;
        font-weight: 600;
        font-size: 13px;
      }
      .desc{
        line-height: 18px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
  }
</style>