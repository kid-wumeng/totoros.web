<template lang="jade">
  .face
    photo-frame
      person-face(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame':  require('components/wiki/photo-frame')
      'person-face': require('components/image/person-face')

    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less">
  .face{
    display: flex;
    justify-content: center;
    .photo-frame{
      width: 160px;
      .person-face{
        cursor: auto;
      }
    }
  }
</style>
