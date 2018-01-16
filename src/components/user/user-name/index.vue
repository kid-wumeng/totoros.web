<template lang="jade">
  .user-name(@click.stop="toUserPage(user)") {{ user.name }}
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
    font-family: "Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
    font-weight: 700;
    color: #445669;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>