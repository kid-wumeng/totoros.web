<template lang="jade">
  text-area.intro(:text="person.intro" indent, :limit="400" more)
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less">
  .intro{
  }
</style>
