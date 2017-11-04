<template lang="jade">
  row.action-bar
    c-button(@click="publish") 吼一个新话题
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
    .right{
      margin-left: 10px;
    }
    .club-face{
      width: 64px;
    }
    .name{
      font-weight: 600;
    }
    .intro{
      font-size: 13px;
    }
  }
</style>