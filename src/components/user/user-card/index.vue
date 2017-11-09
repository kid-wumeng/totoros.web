<template lang="jade">
  .user-card
    row(@click="toUserPage(user)")
      user-face(:user="user")
      column
        .name {{ user.name }}
        .motto(v-if="user.motto") {{ user.motto }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'user-name': require('components/user/user-name')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .user-card{
    box-sizing: border-box;
    display: block;
    >.row2{
      align-items: stretch;
      padding: 8px;
      border: 1px solid rgb(230, 230, 230);
      border-radius: 3px;
      box-shadow: 0 0 10px rgba(100, 100, 100, 0.1);
      cursor: pointer;
    }
    .user-face{
      flex: none;
      width: 56px;
      margin-right: 10px;
    }
    .name{
      font-family: "Helvetica Neue";
      font-weight: 600;
      font-size: 13px;
      color: #445669;
    }
    .motto{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>
