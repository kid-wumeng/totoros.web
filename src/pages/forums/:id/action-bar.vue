<template lang="jade">
  row.action-bar.-right(v-if="login")
    c-button(@click="publish") 发布帖子
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'forum':
        type: Object
        required: true

    methods:
      publish: ->
        @dispatch('post-modal/show', {
          forum: @forum
        })
</script>


<style lang="less" scoped>
  .action-bar{
  }
</style>