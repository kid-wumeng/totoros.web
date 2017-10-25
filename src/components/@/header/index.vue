<template lang="jade">
  .header
    .row
      .row.-left
        logo
        navigator
        search
      account
</template>


<script lang="coffee">
  module.exports =
    components:
      'logo':      require('./logo')
      'navigator': require('./navigator')
      'search':    require('./search')
      'account':   require('./account')
</script>


<style lang="less" scoped>
  .header{
    width: 100%;
    text-align: center;
    >.row{
      margin: 0 auto;
      width: 800px;
      height: 64px;
    }
  }
</style>
