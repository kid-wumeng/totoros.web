<template lang="jade">
  .header(v-if="routePage === 1")
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
  .header{
    display: flex;
    justify-content: space-between;
    align-items: center;
    .title{
      font-weight: 600;
      font-size: 17px;
      color: #273340;
    }
  }
</style>
