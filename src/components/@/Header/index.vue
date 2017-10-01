<template lang="jade">
  .header
    .row
      .row.-left
        logo
        navigator
        search
      user-face(v-if="state.user", :user="state.user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'logo':      require('./Logo')
      'navigator': require('./Navigator')
      'search':    require('./Search')
      'user-face': require('components/image/UserFace')
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
