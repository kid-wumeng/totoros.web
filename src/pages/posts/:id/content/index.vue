<template lang="jade">
  markdown-area.content(v-if="routePage === 1", :content="post.content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')
      'action-bar':    require('./action-bar')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .content{
  }
</style>
