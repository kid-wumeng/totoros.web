<template lang="jade">
  .club-action-bar.row
    .left
    .right
      c-button(@click="publish") 发布贴子
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'id':
        type: Number
        required: true

    methods:
      publish: ->
        @dispatch('post-modal/show', {
          club:
            id: @id
        })
</script>


<style lang="less">
  .club-action-bar{
    margin-bottom: 12px;
  }
</style>