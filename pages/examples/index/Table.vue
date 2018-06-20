<template lang="jade">
   #examples_Table
      Table(auto)
         tr
            th ID
            th 昵称
            th 简介
            th
         tr(v-for="user in users", :key="user.id")
            td {{ user.id }}
            td {{ user.name }}
            td {{ user.intro }}
            td: Row
               Input(hint="新的昵称")
               Button(text="修改")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'Table':  require('~/components/Table').default
         'Row':    require('~/components/Row').default
         'Input':  require('~/components/Input').default
         'Button': require('~/components/Button').default

      data: ->
         users: mocks.users
</script>



<style lang="less">
   #examples_Table {
      .Button {
         margin-left: 12px;
      }
   }
</style>