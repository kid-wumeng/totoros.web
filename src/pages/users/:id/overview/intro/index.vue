<template lang="jade">
  .intro
    markdown-area(:content="user.intro")
</template>


<script lang="coffee">
  module.exports =
    components:
      'markdown-area': require('components/@/markdown-area')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .intro{
  }
</style>