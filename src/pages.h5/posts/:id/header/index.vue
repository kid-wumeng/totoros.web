<template lang="jade">
  .post-header(v-if="routePage === 1")
    .title {{ post.title }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .post-header{
    padding: 20px 20px 0;
    background-color: #FFF;
    .title{
      font-weight: 500;
      font-size: 17px;
      color: #273340;
    }
  }
</style>
