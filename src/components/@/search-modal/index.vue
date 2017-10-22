<template lang="jade">
  c-animate(v-if="state['search-modal'].open" enter="fadeIn" leave="fadeOut")
    .search-modal.col.-left
      action-bar
      result-list
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate':   require('components/@/animate')
      'action-bar':  require('./action-bar')
      'result-list': require('./result-list')

    created: ->
      window.addEventListener('keyup', @keyup)

    methods:
      'keyup': (event) ->
        if(event.keyCode is 27)
          @commit('search-modal/HIDE')
</script>


<style lang="less" scoped>
  .search-modal{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 200;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    animation-duration: 0.3s;
  }
</style>