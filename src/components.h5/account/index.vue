<template lang="jade">
  row.account.-between.-center(v-if="!login")
    .btn(:class="{'-active': $route.path === '/register'}" @click="$router.push('/register')") 注册
    .btn(:class="{'-active': $route.path === '/login'}" @click="$router.push('/login')") 登录
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less">
  .account{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    line-height: 40px;
    background-color: rgb(249, 249, 249);
    .btn{
      flex: auto;
      text-align: center;
      font-weight: 600;
      color: #A2AEBA;
    }
    .btn.-active{
      color: #445669;
    }
  }
</style>