<template lang="jade">
   #examples_Toast
      Button(text="toast" @click="click")
      Toast(:open="open", :text="text")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Toast':  require('~/components/Toast').default
         'Button': require('~/components/Button').default

      data: ->
         open: false
         text: """
            欢迎加入 totoros 大家庭！
            你可以在这里讨论你喜欢的漫画
            请先阅读版规，以了解 totoros 的社区风格
         """

      methods:
         click: ->
            @open = true
            await @io.sleep(3000)
            @open = false
</script>



<style lang="less">
   #examples_Toast {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;

      > .Button {
         margin: 0 auto;
      }
   }
</style>