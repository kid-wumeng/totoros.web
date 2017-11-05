<template lang="jade">
  row.action-bar.-right
    c-button(@click="publish") 吼一个话题
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'club':
        type: Object
        required: true

    methods:
      publish: ->
        @dispatch('post-modal/show', {
          club: @club
        })
</script>


<style lang="less" scoped>
  .action-bar{
  }
</style>