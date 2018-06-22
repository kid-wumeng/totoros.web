<template lang="jade">
   #examples_TabBar
      TabBar(v-model="data", :tabs="tabs")
      TabBar(v-model="data", :tabs="tabs" auto)
</template>



<script lang="coffee">
   module.exports =
      components:
         'TabBar': require('~/components/TabBar').default

      data: ->
         tabs: [
            { data: 'comic', text: '漫画' }
            { data: 'paint', text: '绘本' }
            { data: 'serie', text: 'TV/OVA' }
            { data: 'movie', text: '动画电影' }
         ]

         data: 'paint'
</script>



<style lang="less">
   #examples_TabBar {
      > .TabBar {
         width: 480px;
      }
   }
</style>