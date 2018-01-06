<template lang="jade">
  .item
    .status {{ model.mark.displayStatus(status, type) }}
    .type {{ model.subject.displayTypes(type)[0] }}
    subject-name(:subject="subject")
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
    >*{
      display: inline;
      font-size: 12px;
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