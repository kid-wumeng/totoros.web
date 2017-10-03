<template lang="jade">
  .panel
    h1 {{ state.prompt.message }}
    c-input(v-model="result" autofocus)
    c-button(@click="sure") 确定
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      result: @state.prompt.defaults

    methods:
      sure: ->
        @state.prompt.resolve(@result)
        @commit('prompt/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -10%;
    width: 300px;
    >*{
      margin-bottom: 12px;
    }
    .button{
      display: block;
    }
  }
</style>
