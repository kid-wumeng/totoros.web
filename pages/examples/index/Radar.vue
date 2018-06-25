<template lang="jade">
   #examples_Radar
      Radar(:items="items")
</template>



<script lang="coffee">

   module.exports =
      components:
         'Radar': require('~/components/Radar').default

      data: ->
         items: [
            { text: '世界观', data: 78 }
            { text: '剧情', data: 90 }
            { text: '人设', data: 45 }
            { text: '画风', data: 99 }
         ]
</script>



<style lang="less">
   #examples_Radar {
      .Radar {
         width: 200px;
         background-repeat: no-repeat;
         background-position: center;
         background-size: cover;
      }
   }
</style>