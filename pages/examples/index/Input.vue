<template lang="jade">
   #examples_Input
      Input(hint="昵称")
      Input(hint="密码" type="pass" text="12345678")
      Input(hint="区域" area v-model="mock")
      Button(text="提交模拟文本" @click="submit")
      Input(text="禁用" disabled)
</template>



<script lang="coffee">
   module.exports =
      components:
         'Input':  require('~/components/Input').default
         'Button': require('~/components/Button').default

      data: ->
         mock: """
         《基督山伯爵》是通俗历史小说，法国著名作家大仲马（1802-1870）的代表作。故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·邓蒂斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手森巴），经过精心策划，报答了恩人，惩罚了仇人。充满传奇色彩，奇特新颖，引人入胜。
         """

      methods:
         submit: ->
            alert @mock
</script>



<style lang="less">
   #examples_Input {
      > .Input {
         width: 480px;
      }
      > textarea.Input {
         height: 300px;
         overflow: hidden;
      }
   }
</style>