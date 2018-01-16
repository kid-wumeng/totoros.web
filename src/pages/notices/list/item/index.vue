<template lang="jade">
  component.item(:is="component", :notice="notice", :class="itemClass")
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

      itemClass: ->
        '-unread': @notice.read isnt true
</script>


<style lang="less" scoped>
  .item{
    padding: 30px;
  }
  .item.-unread{
    background-image: url(http://cdn.totoros.cc/assets/new-badge?2018-01-18);
    background-repeat: no-repeat;
    background-position: right top;
    background-size: 56px;
  }
</style>