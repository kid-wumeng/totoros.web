<template lang="jade">
  .create-mark
    span {{ verb }}
    span 『
    span.subject-name(@click="toSubjectPage(subject)") {{ name }}
    span 』
</template>


<script lang="coffee">
  module.exports =
    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      status:  -> @mark?.status
      subject: -> @mark?.subject
      type:    -> @subject?.type
      name:    -> @subject?.name
      verb:    ->
        status = @model.mark.displayStatus(@status, @type)
        type   = @model.subject.displayTypes(@type)[0]
        return status + type
</script>


<style lang="less" scoped>
  .create-mark{
    >*{
      font-size: inherit;
      color: inherit;
    }
    .subject-name{
      margin: 0 2px;
      font-weight: 500;
      color: #445669;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
  }
</style>