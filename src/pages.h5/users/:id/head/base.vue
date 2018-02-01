<template lang="jade">
  .base
    .name-row
      span.name {{ user.name }}
      span.logout(v-if="isMe(user)" @click="$router.push('/logout')") ( 退出登录 )
    .motto {{ user.motto }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    box-sizing: border-box;
    .name{
      font-weight: 600;
      font-size: 16px;
      vertical-align: middle;
    }
    .logout{
      margin-left: 9px;
      font-weight: 600;
      font-size: 10px;
      color: #A2AEBA;
      vertical-align: middle;
    }
    .motto{
      margin-top: 3px;
      font-size: 12px;
      color: #707C88;
    }
  }
</style>