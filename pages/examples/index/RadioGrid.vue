<template lang="jade">
   #examples_RadioGrid
      p 多选：{{ type }}
      RadioGrid(:radios="radios", :cols="9" many v-model="type")
</template>



<script lang="coffee">
   module.exports =
      components:
         'RadioGrid': require('~/components/RadioGrid').default

      data: ->
         radios: [
            { data: 'comic', text: '漫画' }
            { data: 'paint', text: '绘本' }
            { data: 'serie', text: 'TV/OVA' }
            { data: 'movie', text: '动画电影' }
         ]

         type: ['paint', 'movie']
</script>



<style lang="less">
   #examples_RadioGrid {
      > .RadioGrid {
         width: 480px;
      }
   }
</style>