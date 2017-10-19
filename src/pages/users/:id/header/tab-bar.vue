<template lang="jade">
  tab-bar.row.-left(:tabs="tabs", :active="$route.meta.path", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('components/@/tab-bar')

    props:
      'user':
        type: Object
        required: true

    computed:
      tabs: -> [{
        label: 'Overview'
        value: ''
      },{
        label: 'Timeline'
        value: 'timeline'
        count: @user.feedCount
      },{
        label: '日志'
        value: 'blogs'
        count: @user.blogCount
      },{
        label: '绘画'
        value: 'paints'
        count: @user.paintCount
      },{
        label: 'Animes'
        value: 'animes'
        count: @model.user.markStat(@user, null, 'anime')
      },{
        label: 'Comics'
        value: 'comics'
        count: @model.user.markStat(@user, null, 'comic')
      },{
        label: 'Games'
        value: 'games'
        count: @model.user.markStat(@user, null, 'game')
      }]

    methods:
      change: (tab) ->
        @toUserPage(@user, tab.value)
</script>


<style lang="less">
  .tab-bar{
    .tab{
      padding: 0 10px;
      height: 30px;
      line-height: 20px;
      &:first-child{
        padding-left: 0;
      }
      .label{
        font-size: 13px;
        color: #A2AEBA;
      }
      .count{
        font-size: 13px;
        color: #A2AEBA;
        margin-left: 4px;
      }
    }
    .tab.-active{
      font-weight: 600;
      .label{
        color: #445669;
      }
      .count{
        color: #445669;
      }
    }
  }
</style>