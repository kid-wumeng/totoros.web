<template lang="jade">
  .list
    c-table
      .user(v-for="user in users", :key="user.id" @click="toUserPage(user)")
        .id    \#{{ user.id }}
        user-face(:user="user")
        .name  {{ user.name }}
        .motto {{ user.motto }}
        .date  {{ model.date.display(user.createDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-table':   require('components/@/table')
      'user-face': require('components/image/user-face')

    data: ->
      users: []

    created: ->
      @init()

    methods:
      init: ->
        result = await @api.call('user.getAll')
        @users = result.users
</script>


<style lang="less">
  .list{
    .user{
      cursor: pointer;
      .id{
        width: 15%;
      }
      .user-face{
        width: 30px;
        height: 30px;
      }
      .name{
        width: 30%;
      }
      .motto{
        width: 30%;
      }
      .date{
        width: 15%;
      }
    }
  }
</style>