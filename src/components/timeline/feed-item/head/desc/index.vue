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
    margin-left: 5px;
    margin-right: 30px;
    font-weight: 600;
    font-size: 14px;
    color: #A2AEBA;
  }
</style>