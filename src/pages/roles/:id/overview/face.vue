<template lang="jade">
  .face
    role-face(:role="role" frame)
</template>


<script lang="coffee">
  module.exports =
    components:
      'role-face': require('components/image/role-face')

    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less">
  .face{
    display: flex;
    justify-content: center;
    .role-face{
      width: 160px;
      cursor: auto !important;
    }
  }
</style>
