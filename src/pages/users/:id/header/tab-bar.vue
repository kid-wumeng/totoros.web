<template lang="jade">
  tab-bar.tab-bar.user-detail-tab-bar(:tabs="tabs", :active="$route.meta.path", @change="change")
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
        label: @user.name
        value: ''
      },{
        label: '动态'
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
        if @isMe(@user)
          switch tab.value
            when 'animes' then if @model.user.markStat(@user, 'doing', 'anime') then return @toUserPage(@user, 'animes?status=doing')
            when 'comics' then if @model.user.markStat(@user, 'doing', 'comic') then return @toUserPage(@user, 'comics?status=doing')
            when 'games'  then if @model.user.markStat(@user, 'doing', 'game')  then return @toUserPage(@user, 'games?status=doing')
        @toUserPage(@user, tab.value)
</script>


<style lang="less">
  .user-detail-tab-bar{
    .tab{
      padding: 0 14px;
      height: 26px;
      font-weight: 600;
      display: block;
      .label{
        display: inline;
        font-size: 13px;
        color: #CDD6E0;
      }
      .count{
        display: inline;
        font-size: 13px;
        color: #CDD6E0;
        margin-left: 4px;
      }
    }
    .tab.-active{
      border-bottom: 2px solid #40C9A2;
      .label{
        color: #40C9A2;
      }
      .count{
        color: #40C9A2;
      }
    }
  }
</style>