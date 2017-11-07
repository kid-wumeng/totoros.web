<template lang="jade">
  component.c-body(:is="component", :feed="feed")
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
  .c-body{
  }
</style>