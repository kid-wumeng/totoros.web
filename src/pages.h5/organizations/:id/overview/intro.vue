<template lang="jade">
  text-area.intro(:text="organization.intro" indent, :limit="400" more)
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less">
  .intro{
  }
</style>
