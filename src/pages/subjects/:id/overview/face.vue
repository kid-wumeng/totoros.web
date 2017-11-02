<template lang="jade">
  .face
    subject-face(:subject="subject" frame)
</template>


<script lang="coffee">
  module.exports =
    components:
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
    .subject-face{
      width: 160px;
      cursor: auto;
    }
  }
</style>
