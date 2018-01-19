<template lang="jade">
  .face
    organization-face(:organization="organization" frame)
</template>


<script lang="coffee">
  module.exports =
    components:
      'organization-face': require('components/image/organization-face')

    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less">
  .face{
    .organization-face{
      width: 80px;
    }
  }
</style>