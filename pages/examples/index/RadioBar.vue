<template lang="jade">
   #examples_RadioBar
      RadioBar(:radios="radios")
</template>



<script lang="coffee">
   module.exports =
      components:
         'RadioBar': require('~/components/RadioBar').default

      data: ->
         radios: [
            { data: 'comic', text: '漫画' }
            { data: 'paint', text: '绘本' }
            { data: 'serie', text: 'TV/OVA' }
            { data: 'movie', text: '动画电影' }
         ]
</script>



<style lang="less">
   #examples_RadioBar {
      > .RadioBar {
         width: 480px;
      }
   }
</style>