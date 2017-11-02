<template lang="jade">
  .face
    person-face(:person="person" frame)
</template>


<script lang="coffee">
  module.exports =
    components:
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
    .person-face{
      width: 160px;
      cursor: auto;
    }
  }
</style>
