<template lang="jade">
  .user-card
    row
      user-face(:user="user")
      column
        user-name(:user="user")
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
      padding: 10px;
      border: 1px solid rgb(230, 230, 230);
      border-radius: 3px;
      box-shadow: 0 0 10px rgba(100, 100, 100, 0.1);
    }
    .user-face{
      flex: none;
      width: 56px;
      margin-right: 10px;
    }
    .user-name{
      font-size: 13px;
    }
    .motto{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>
