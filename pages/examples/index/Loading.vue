<template lang="jade">
   #examples_Loading
      Button(text="无限 loading", @click="click1")
      Button(text="有限 loading", @click="click2")
      Loading(:open="open1")
      Loading(:open="open2", :value="value")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Loading': require('~/components/Loading').default
         'Button':  require('~/components/Button').default

      data: ->
         open1: false
         open2: false
         value: 60

      methods:
         click1: ->
            @open1 = true
            await @io.sleep(3000)
            @open1 = false

         click2: ->
            @open2 = true
            await @io.sleep(1000)
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
            await @io.sleep(1000)
            @open2 = false
</script>