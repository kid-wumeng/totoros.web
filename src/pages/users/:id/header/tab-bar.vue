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
        count: 7
      },{
        label: '日志'
        value: 'blogs'
        count: 18
      },{
        label: '绘画'
        value: 'paints'
        count: 6
      },{
        label: 'Animes'
        value: 'animes'
        count: 251
      },{
        label: 'Comics'
        value: 'comics'
        count: 125
      },{
        label: 'Games'
        value: 'games'
        count: 12
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