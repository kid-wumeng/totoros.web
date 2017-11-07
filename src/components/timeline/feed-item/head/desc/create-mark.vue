<template lang="jade">
  .create-mark
    span {{ verb }}
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
  }
</style>