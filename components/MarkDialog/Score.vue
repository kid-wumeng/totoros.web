<template lang="jade">
   Rate.Score(:score="score" size="large" changeable @change="change")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Rate': require('~/components/Rate').default

      model:
         prop:  'score'
         event: 'change'

      props:
         'score':
            type: Number
            required: true
            validator: (score) => [0, 1, 2, 3, 4, 5, 6, 7].includes(score)

      methods:
         change: (score) -> @$emit('change', score)
</script>



<style lang="less">
   .Score {
      display: flex;
      justify-content: center;
   }
</style>