<template lang="jade">
  .face
    photo-frame
      organization-face(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame':       require('components/wiki/photo-frame')
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
    .photo-frame{
      width: 160px;
      .organization-face{
        cursor: auto;
      }
    }
  }
</style>
