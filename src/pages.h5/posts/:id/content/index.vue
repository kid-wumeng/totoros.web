<template lang="jade">
  floor.content(v-if="routePage === 1", :user="post.user", :content="post.content", :date="post.createDate", floor="主题")
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components.h5/floor')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .content{
  }
</style>
