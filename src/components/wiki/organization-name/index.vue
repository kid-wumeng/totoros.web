<template lang="jade">
  .organization-name(@click="toOrganizationPage(organization)") {{ organization.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .organization-name{
    display: inline;
    font-weight: 500;
    font-size: 14px;
    color: #445669;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>