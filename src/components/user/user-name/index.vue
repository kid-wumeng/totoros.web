<template lang="jade">
  .user-name(@click="toUserPage(user)") {{ user.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .user-name{
    font-weight: 600;
    color: #A2AEBA;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>