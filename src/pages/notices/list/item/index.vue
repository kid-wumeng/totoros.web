<template lang="jade">
  component.item(:is="component", :notice="notice")
</template>


<script lang="coffee">
  module.exports =
    components:
      'comment': require('./comment')

    props:
      'notice':
        type: Object
        required: true

    computed:
      component: ->
        switch @notice.type
          when 'comment' then 'comment'
          else ''
</script>


<style lang="less" scoped>
  .item{
    padding: 0 28px;
  }
</style>