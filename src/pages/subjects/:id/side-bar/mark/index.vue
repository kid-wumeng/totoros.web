<template lang="jade">
  .mark(v-if="markSure")
    has-mark(v-if="mark", :mark="mark")
    not-mark(v-else, :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'has-mark': require('./has-mark')
      'not-mark': require('./not-mark')

    computed:
      subject:  -> @state['subject-detail'].subject
      mark:     -> @state['subject-detail'].mark
      markSure: -> @state['subject-detail'].markSure
</script>


<style lang="less" scoped>
  .mark{
    align-items: stretch;
    .button{
      text-align: left;
      font-weight: 400;
      font-size: 13px;
      margin-bottom: 6px;
    }
  }
</style>