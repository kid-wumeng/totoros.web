<template lang="jade">
   .Item
      Tip(:text="text" auto)
         .text(:active="data" @click="click") {{ io.formatScore(name) }} +1
</template>



<script lang="coffee">
   module.exports =

      components:
         'Tip': require('~/components/Tip').default

      model:
         prop:  'data'
         event: 'change'

      props:
         'data':
            type: Boolean
            required: true
         'name':
            type: String
            required: true

      computed:
         text: ->
            switch @name
               when 'world' then '世界的构成让人印象深刻，比如历史漫时代感复原到位，或奇特的幻想世界等'
               when 'story' then '剧情有趣 / 故事有深度 / 叙事节奏急缓有度'
               when 'roles' then '人物（或其它生物、机体）有个性、刻画生动、形象饱满'
               when 'paint' then '画风独特 / 画功扎实'
               when 'music' then '主题曲、配乐、音效动听，与动画浑然天成'

      methods:
         click: -> @$emit('change', !@data)
</script>



<style lang="less">
   .Item {
      font-size: 14px;
      color: #A2AEBA;
      cursor: pointer;

      .text[active] {
         font-weight: 500;
         color: #F3C02D;
      }
   }
</style>