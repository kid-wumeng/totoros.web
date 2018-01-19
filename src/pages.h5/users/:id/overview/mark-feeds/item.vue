<template lang="jade">
  row.item.-between.-center
    .left
      .status {{ model.mark.displayStatus(status, type) }}
      .type {{ model.subject.displayTypes(type)[0] }}
      subject-name(:subject="subject")
    .right
      .date {{ model.date.display(date) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-name': require('components/wiki/subject-name')

    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      date:    -> @feed.createDate
      status:  -> @mark.status
      subject: -> @mark.subject
      type:    -> @subject.type
      name:    -> @subject.name
</script>


<style lang="less" scoped>
  .item{
    *{
      font-size: 12px;
    }
    .left > *{
      display: inline;
    }
    .right{
      flex: none;
    }
    .subject-name{
      font-size: 12px;
      margin: 0 6px;
    }
    .status, .type, .date{
      color: #A2AEBA;
    }
  }
</style>