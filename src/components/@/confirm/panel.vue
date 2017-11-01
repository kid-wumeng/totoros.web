<template lang="jade">
  .panel
    h1 {{ state.confirm.message }}
    row.-right
      c-button.-gray(@click="cancel") 取消
      c-button.-gray(@click="sure")   确定
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    data: ->
      result: @state.confirm.defaults

    methods:
      cancel: ->
        @commit('confirm/HIDE')

      sure: ->
        @state.confirm.resolve(@result)
        @commit('confirm/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -10%;
    width: 240px;
    >*{
      margin-bottom: 24px;
    }
    .button{
      display: block;
      margin-left: 6px;
    }
  }
</style>
