<template lang="jade">
  .relative-wiki
    detail-box(v-if="relativeSubjects.length" title="本帖关联作品")
      subject-card(v-for="subject in relativeSubjects", :key="subject.id", :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':   require('components/bbs/detail-box')
      'subject-card': require('./subject-card')

    props:
      'relativeSubjects':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .relative-wiki{
  }
</style>