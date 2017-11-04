<template lang="jade">
  .action-bar.row
    .left
      h1 CLUBS
    .right
      c-button(@click="create") 创建社团
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    methods:
      create: ->
        @commit('create-club-modal/SHOW')
</script>


<style lang="less">
  .action-bar{
    padding: 12px;
    h1{
      color: #A2AEBA;
    }
  }
</style>