<template lang="jade">
  .face
    photo-frame
      role-face(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame':  require('components/wiki/photo-frame')
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
    .photo-frame{
      width: 160px;
      .role-face{
        cursor: auto;
      }
    }
  }
</style>
