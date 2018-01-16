<template lang="jade">
  .admin.-underline(v-if="admin" @click="$router.push('/admin')")
    span ADMIN
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
</script>


<style lang="less" scoped>
  .admin{
    margin-right: 28px;
    font-weight: 600;
    cursor: pointer;
    span{
      font-size: 13px;
    }
  }
</style>
