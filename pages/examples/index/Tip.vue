<template lang="jade">
   #examples_Tip

      Tip(:text="tipText", :open="tipOpen")
         Input(hint="昵称" @focus="focus" @blur="blur")

      Tip(text="欢迎加入 totoros 大家庭！" auto)
         Button(text="注册")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Tip':    require('~/components/Tip').default
         'Input':  require('~/components/Input').default
         'Button': require('~/components/Button').default

      data: ->
         tipText: """
            取个喜欢的昵称吧 ~
            昵称可以由中英文、数字组成
         """
         tipOpen: false

      methods:
         focus: ->
            @tipOpen = true

         blur:  ->
            @tipOpen = false
</script>