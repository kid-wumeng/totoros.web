<template lang="jade">
  #reset-pass(v-if="checkined && !login")
    step-1(v-if="!$route.query.email")
    step-2(v-else)
</template>


<script lang="coffee">
  module.exports =
    components:
      'step-1': require('./step-1')
      'step-2': require('./step-2')

    data: ->
      email: ''
</script>


<style lang="less" scoped>
  #reset-pass{
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>