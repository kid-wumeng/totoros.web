<template lang="jade">
  .header
    row.-between.-center
      row.-center
        logo
        navigator
        search
      row.-center
        admin
        reminder(v-if="login")
        account
</template>


<script lang="coffee">
  module.exports =
    components:
      'logo':      require('./logo')
      'navigator': require('./navigator')
      'search':    require('./search')
      'admin':     require('./admin')
      'reminder':  require('./reminder')
      'account':   require('./account')
</script>


<style lang="less" scoped>
  .header{
    position: fixed;
    z-index: 10;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.8);
    border-bottom: 1px solid rgb(245, 245, 245);
    >.row2{
      margin: 0 auto;
      width: 1000px;
      >.row2{
        height: 64px;
      }
    }
  }
</style>
