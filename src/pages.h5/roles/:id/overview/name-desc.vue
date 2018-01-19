<template lang="jade">
  .name-desc
    .name(slot="name") {{ role.name }}
    .desc(slot="desc") 角色
</template>


<script lang="coffee">
  module.exports =
    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .name-desc{
    margin-left: 16px;
    >.name{
      font-weight: 500;
      font-size: 18px;
    }
    >.desc{
      font-weight: 500;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>