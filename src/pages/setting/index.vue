<template lang="jade">
  #setting(v-if="login && user")
    .wrap
      tab-bar
      .main
        router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')

    computed:
      user: -> @state['setting'].user

    created: ->
      @init()

    methods:
      init: ->
        @dispatch('setting/init')
</script>


<style lang="less" scoped>
  #setting{
    background-color: #FFF;
    overflow: hidden;
    >.wrap{
      margin: 32px auto;
      width: 480px;
      >.main{
        padding: 16px;
        border: 1px solid #FFF;
        border-radius: 3px;
        box-shadow: 0 0 6px -3px #000;
      }
    }
  }
</style>
