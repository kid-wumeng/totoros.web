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
    font-family: "Helvetica Neue";
    font-weight: 500;
    color: #59ABE3;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>