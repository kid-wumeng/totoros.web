<template lang="jade">
  .role-name(@click="toRolePage(role)") {{ role.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .role-name{
    display: inline;
    font-weight: 600;
    font-size: 14px;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>