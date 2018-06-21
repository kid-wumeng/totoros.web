<template lang="jade">
   #examples_ProgressBar
      ProgressBar(:value="value", :total="100")
      Button(text="改变进度", @click="click")
</template>



<script lang="coffee">
   module.exports =
      components:
         'ProgressBar': require('~/components/ProgressBar').default
         'Button':      require('~/components/Button').default

      data: ->
         value: 60

      methods:
         click: ->
            @value = 0
            await @io.sleep(1000)
            @value = 20
            await @io.sleep(1000)
            @value = 40
            await @io.sleep(1000)
            @value = 60
            await @io.sleep(1000)
            @value = 80
            await @io.sleep(1000)
            @value = 100
</script>



<style lang="less">
   #examples_ProgressBar {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;

      .ProgressBar {
         width: 600px;
         margin: 0 auto;
      }

      .Button {
         margin: 0 auto;
      }
   }
</style>