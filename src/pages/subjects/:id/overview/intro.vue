<template lang="jade">
  text-area.intro(:text="subject.intro" indent, :limit="400" more :gap="4")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less">
  .intro{
  }
</style>
