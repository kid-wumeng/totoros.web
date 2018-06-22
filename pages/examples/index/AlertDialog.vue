<template lang="jade">
   #examples_AlertDialog
      Button(text="Alert", @click="open = true")
      AlertDialog(:open="open" text="头上有会动的天线来捕捉信号和匹特星人的命令，白色身体上点缀些一些黑点，甚是特别。最早被匹特星人藏在木曾谷 的吾妻湖。\n口中能发射光弹，而其常用攻击手段是用标志性长长的尾巴缠住对手，然后放电攻击对手。不过在与赛文交战中虽然电击赛文，但后来其头部的天线被艾梅利光破坏， 尾巴被头镖切断而死。其名字来源于“电气之王”。艾雷王是奥特曼系列中相当受欢迎的怪兽，在泰罗第28集《怪兽艾雷王》中稍改其形象登场，而在在赛文94电视特别版第1集《 太阳能作战》中随匹特星人回到地球。此外，在麦克斯第2集《饲养怪兽的女子》和第27集《被夺走的麦克斯火花》中以吸电龙的姿态登场，梦比优斯中则以人造怪兽的姿态，以小艾雷王的可爱身份登场。" @close="open = false")
</template>



<script lang="coffee">
   module.exports =

      components:
         'AlertDialog': require('~/components/AlertDialog').default
         'Button':      require('~/components/Button').default

      data: ->
         open: true
</script>