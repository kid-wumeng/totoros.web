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
    font-weight: 600;
    font-size: 14px;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>