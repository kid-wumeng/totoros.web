<template lang="jade">
  .intro.box-frame(v-if="user.intro")
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
    box-sizing: border-box;
    padding: 24px 32px;
    border-radius: 3px;
  }
</style>