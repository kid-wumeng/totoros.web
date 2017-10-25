<template lang="jade">
  .comic-marks
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
      title: -> "标记的漫画"

      tabs: -> [{
        label: @model.mark.displayStatus('will-do', 'comic')
        count: @model.user.markStat(@user, 'will-do', 'comic')
        click: => @toUserPage(@user, 'comics?status=will-do')
      },{
        label: @model.mark.displayStatus('doing', 'comic')
        count: @model.user.markStat(@user, 'doing', 'comic')
        click: => @toUserPage(@user, 'comics?status=will-do')
      },{
        label: @model.mark.displayStatus('done', 'comic')
        count: @model.user.markStat(@user, 'done', 'comic')
        click: => @toUserPage(@user, 'comics?status=will-do')
      },{
        label: @model.mark.displayStatus('do-not', 'comic')
        count: @model.user.markStat(@user, 'do-not', 'comic')
        click: => @toUserPage(@user, 'comics?status=will-do')
      }].filter (tab) -> tab.count
</script>


<style lang="less" scoped>
  .comic-marks{
    .done{
      margin-top: 10px;
    }
  }
</style>