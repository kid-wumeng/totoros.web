<template lang="jade">
  component.feed-body(:is="component", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'create-mark': require('./create-mark')
      'create-post': require('./create-post')

    props:
      'feed':
        type: Object
        required: true

    computed:
      component: ->
        switch @feed.type
          when 'create-mark' then 'create-mark'
          when 'create-post' then 'create-post'
          else ''
</script>


<style lang="less" scoped>
  .feed-body{
    box-sizing: border-box;
    padding: 20px;
  }
</style>