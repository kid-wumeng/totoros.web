<template lang="jade">
  component.desc(:is="component", :feed="feed")
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
  .desc{
    margin-left: 6px;
    font-size: 13px;
    color: #A2AEBA;
  }
</style>