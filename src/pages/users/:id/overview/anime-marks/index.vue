<template lang="jade">
  .anime-marks
    detail-area(:title="title", :tabs="tabs")
      doing(:user="user")
      done(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components/user/detail-area')
      'doing':       require('./doing')
      'done':        require('./done')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "标记的动画"

      tabs: -> [{
        label: @model.mark.displayStatus('will-do', 'anime')
        count: @model.user.markStat(@user, 'will-do', 'anime')
        click: => @toUserPage(@user, 'animes?status=will-do')
      },{
        label: @model.mark.displayStatus('doing', 'anime')
        count: @model.user.markStat(@user, 'doing', 'anime')
        click: => @toUserPage(@user, 'animes?status=will-do')
      },{
        label: @model.mark.displayStatus('done', 'anime')
        count: @model.user.markStat(@user, 'done', 'anime')
        click: => @toUserPage(@user, 'animes?status=will-do')
      },{
        label: @model.mark.displayStatus('do-not', 'anime')
        count: @model.user.markStat(@user, 'do-not', 'anime')
        click: => @toUserPage(@user, 'animes?status=will-do')
      }].filter (tab) -> tab.count
</script>


<style lang="less" scoped>
  .anime-marks{
    .done{
      margin-top: 10px;
    }
  }
</style>