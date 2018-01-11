<template lang="jade">
  floor.content(v-if="routePage === 1", :user="post.user", :content="post.content", :date="post.createDate", floor="主帖")
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components/@/floor')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .content{
    padding-bottom: 20px;
    border-bottom: 1px solid #F2F2F2;
  }
</style>
