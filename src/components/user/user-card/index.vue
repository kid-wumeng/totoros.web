<template lang="jade">
  .user-card
    router-link(:to="getUserPath(user)")
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
    > a{
      display: flex;
      align-items: stretch;
      padding: 16px;
      cursor: pointer;
    }
    .user-face{
      flex: none;
      width: 40px;
      margin-right: 12px;
    }
    .name{
      font-family: "Helvetica Neue";
      font-weight: 500;
      font-size: 13px;
      color: #445669;
    }
    .motto{
      margin-top: 3px;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
  .user-card:nth-child(10n+1),
  .user-card:nth-child(10n+2),
  .user-card:nth-child(10n+3),
  .user-card:nth-child(10n+4),
  .user-card:nth-child(10n+5){
    background-color: rgb(249, 249, 249);
  }
</style>
