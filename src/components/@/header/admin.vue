<template lang="jade">
  .admin.-underline(v-if="admin" @click="$router.push('/admin')")
    span ADMIN-CENTER
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
</script>


<style lang="less" scoped>
  .admin{
    margin-right: 20px;
    font-weight: 600;
    cursor: pointer;
  }
</style>
