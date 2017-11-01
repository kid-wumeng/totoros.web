<template lang="jade">
  .header
    .row
      .row.-left
        logo
        navigator
        search
      row.-center
        admin
        account
</template>


<script lang="coffee">
  module.exports =
    components:
      'logo':      require('./logo')
      'navigator': require('./navigator')
      'search':    require('./search')
      'admin':     require('./admin')
      'account':   require('./account')
</script>


<style lang="less" scoped>
  .header{
    width: 100%;
    background-color: rgba(250, 250, 250, 0.93);
    display: flex;
    align-items: center;
    >.row{
      margin: 0 auto;
      width: 1000px;
      height: 64px;
    }
  }
</style>
