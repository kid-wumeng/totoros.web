<template lang="jade">
  .header
    .row
      .row.-left
        logo
        navigator
        search
      user-face(v-if="login", :user="state.account.user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'logo':      require('./logo')
      'navigator': require('./navigator')
      'search':    require('./search')
      'user-face': require('components/image/user-face')
</script>


<style lang="less" scoped>
  .header{
    width: 100%;
    text-align: center;
    >.row{
      margin: 0 auto;
      width: 800px;
      height: 54px;
      .user-face{
        width: 32px;
        height: 32px;
      }
    }
  }
</style>
