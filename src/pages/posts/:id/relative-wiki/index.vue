<template lang="jade">
  relative-wiki(:relativeSubjects="relativeSubjects")
</template>


<script lang="coffee">
  module.exports =
    components:
      'relative-wiki': require('components/@/relative-wiki')

    props:
      'post':
        type: Object
        required: true

    computed:
      relativeSubjects: -> @post.relativeSubjects ? []
</script>


<style lang="less" scoped>
  .relative-wiki{
  }
</style>