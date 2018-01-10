<template lang="jade">
  row.subject-card
    .left
      subject-face(:subject="subject" frame)
    .right
      subject-name(:subject="subject")
      .desc {{ desc }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face': require('components/image/subject-face')
      'subject-name': require('components/wiki/subject-name')

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
    .left{
      .subject-face{
        width: 36px;
      }
    }
    .right{
      margin-left: 7px;
      margin-top: -2px;
      .subject-name{
        font-size: 12px;
      }
      .desc{
        line-height: 18px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
  }
</style>