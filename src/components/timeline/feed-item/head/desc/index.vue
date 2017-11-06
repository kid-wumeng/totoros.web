<template lang="jade">
  component.desc.-more(:is="component", :feed="feed")
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
  .desc{
    width: 400px;
    margin-left: 6px;
    font-size: 13px;
    font-weight: 500;
    color: #A2AEBA;
  }
</style>