<template lang="jade">
  .reminder(@click="$router.push('/notices')")
    .icon.fa-bell-o(v-if="checkined && login")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')
</script>


<style lang="less" scoped>
  .reminder{
    margin-right: 20px;
    cursor: pointer;
    .icon{
      font-size: 18px;
    }
  }
</style>
