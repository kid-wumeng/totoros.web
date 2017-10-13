<template lang="jade">
  .forum-action-bar.row
    .left
    .right
      c-button(@click="publish") 发布帖子
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'fid':
        type: Number
        required: true

    methods:
      publish: ->
        @dispatch('post-modal/show', {
          forum:
            id: @fid
        })
</script>


<style lang="less">
  .forum-action-bar{
    margin-bottom: 12px;
  }
</style>