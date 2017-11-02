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
    display: flex;
    justify-content: center;
    .organization-face{
      width: 160px;
      cursor: auto;
    }
  }
</style>
