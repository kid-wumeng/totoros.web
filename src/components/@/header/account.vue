<template lang="jade">
  .account
    user-face(v-if="checkined && login", :user="state.account.user" circle)
    c-button.-gray(v-if="checkined && !login" @click="$router.push('/login')") LOGIN
    c-button(v-if="checkined && !login" @click="$router.push('/register')")    注册，加入我们
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'c-button':  require('components/@/button')
</script>


<style lang="less" scoped>
  .account{
    .user-face{
      width: 36px;
      height: 36px;
    }
    .button:first-child{
      position: relative;
      top: 1px;
      margin-right: 8px;
      border: 1px solid #66C277;
      color: #66C277;
    }
  }
</style>
