<template lang="jade">
  .intro(v-if="user.intro")
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
    padding: 0 20px;
    .markdown-area{
      line-height: 19px;
      text-align: justify;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>