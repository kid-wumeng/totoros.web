<template lang="jade">
  component.body(:is="component", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'create-mark': require('./create-mark')

    props:
      'feed':
        type: Object
        required: true

    computed:
      component: ->
        switch @feed.type
          when 'create-mark' then 'create-mark'
          else ''
</script>


<style lang="less" scoped>
  .body{
    box-sizing: border-box;
    padding: 12px;
  }
</style>