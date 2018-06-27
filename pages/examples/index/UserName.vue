<template lang="jade">
   #examples_UserName
      UserName(:user="user1")
      UserName(:user="user2")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'UserName': require('~/components/UserName').default

      data: ->
         user1: mocks.users[0]
         user2: mocks.users[1]
</script>