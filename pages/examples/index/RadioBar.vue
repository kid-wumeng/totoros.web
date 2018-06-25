<template lang="jade">
   #examples_RadioBar

      p 单选：{{ data1 }}
      RadioBar(v-model="data1", :radios="radios" type="solid")
      RadioBar(v-model="data1", :radios="radios" type="ghost")
      RadioBar(v-model="data1", :radios="radios" type="solid" auto)
      RadioBar(v-model="data1", :radios="radios" type="ghost" auto)

      p 多选：{{ data2 }}
      RadioBar(v-model="data2", :radios="radios" type="solid" many)
      RadioBar(v-model="data2", :radios="radios" type="ghost" many)
      RadioBar(v-model="data2", :radios="radios" type="solid" many auto)
      RadioBar(v-model="data2", :radios="radios" type="ghost" many auto)
</template>



<script lang="coffee">
   module.exports =
      components:
         'RadioBar': require('~/components/RadioBar').default

      data: ->
         radios: [
            { data: 'comic', text: '漫画' }
            { data: 'paint', text: '绘本' }
            { data: 'anime', text: 'TV/OVA' }
            { data: 'movie', text: '动画电影' }
         ]

         data1: 'paint'
         data2: ['paint', 'movie']
</script>



<style lang="less">
   #examples_RadioBar {
      > .RadioBar {
         width: 480px;
      }
   }
</style>