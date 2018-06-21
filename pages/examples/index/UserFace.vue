<template lang="jade">
   #examples_UserFace
      UserFace(:user="user")
      UserFace(:user="user" circle)
      UserFace(:user="null")
      UserFace(:user="null" circle)
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'UserFace': require('~/components/UserFace').default

      data: ->
         user: mocks.user
</script>



<style lang="less">
   #examples_UserFace {
      .UserFace {
         width: 120px;
      }
   }
</style>