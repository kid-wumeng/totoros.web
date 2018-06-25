<template lang="jade">
   #examples_Radar
      .wrap
         Tip(:text="tip1" auto): Radar(:items="items1")
         Tip(:text="tip2" auto): Radar(:items="items2")
</template>



<script lang="coffee">

   module.exports =
      components:
         'Radar': require('~/components/Radar').default
         'Tip':   require('~/components/Tip').default

      data: ->
         tip1: """
            ≈ 78% 的人喜欢〖 世界观 〗
            ≈ 90% 的人喜欢〖 剧情 〗
            ≈ 45% 的人喜欢〖 角色 〗
            ≈ 22% 的人喜欢〖 画风 〗
         """

         items1: [
            { text: '世界观', data: 78 }
            { text: '剧情', data: 90 }
            { text: '角色', data: 45 }
            { text: '画风', data: 22 }
         ]

         tip2: """
            ≈ 78% 的人喜欢〖 世界观 〗
            ≈ 90% 的人喜欢〖 剧情 〗
            ≈ 45% 的人喜欢〖 角色 〗
            ≈ 22% 的人喜欢〖 画风 〗
            ≈ 56% 的人喜欢〖 音乐 〗
         """

         items2: [
            { text: '世界观', data: 78 }
            { text: '剧情', data: 90 }
            { text: '角色', data: 45 }
            { text: '画风', data: 22 }
            { text: '音乐', data: 56 }
         ]
</script>



<style lang="less">
   #examples_Radar {
      justify-content: center;

      .wrap {
         margin: 0 auto;

         .Tip {
            .Radar {
               width: 200px;
            }
         }

         .Tip:last-child {
            margin-top: 50px;
         }
      }
   }
</style>