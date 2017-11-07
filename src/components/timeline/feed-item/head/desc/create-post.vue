<template lang="jade">
  .create-post
    span 发起了一个话题
</template>


<script lang="coffee">
  module.exports =
    props:
      'feed':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .create-post{
    >*{
      font-size: inherit;
      color: inherit;
    }
  }
</style>