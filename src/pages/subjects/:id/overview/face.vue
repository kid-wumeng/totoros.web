<template lang="jade">
  .face
    photo-frame
      subject-face(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame':  require('components/wiki/photo-frame')
      'subject-face': require('components/image/subject-face')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less">
  .face{
    display: flex;
    justify-content: center;
    .photo-frame{
      width: 160px;
    }
  }
</style>
