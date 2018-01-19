<template lang="jade">
  .name-desc
    .name(slot="name") {{ organization.name }}
    .desc(slot="desc") 团体
</template>


<script lang="coffee">
  module.exports =
    props:
      'organization':
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