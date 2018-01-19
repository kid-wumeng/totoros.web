<template lang="jade">
  text-area.intro(:text="role.intro" indent, :limit="400" more)
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less">
  .intro{
  }
</style>