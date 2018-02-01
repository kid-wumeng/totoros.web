<template lang="jade">
  tab-bar.forum-tab-bar(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('components/@/tab-bar')

    props:
      'forum':
        type: Object
        required: true

    data: ->
      forums: []

    computed:
      tabs: ->
        return @forums.map (forum) =>
          return
            label: forum.nameSimple
            value: forum.id
            count: @getPostCount(forum) + @getCommentCount(forum)

      active: -> @forum.id

    created: ->
      @init()

    activated: ->
      @init()

    methods:
      init: ->
        @forums = await api.call('forum.getAll', {open: true})

      change: (tab) ->
        @$router.replace('/forums/' + tab.value)

      getPostCount: (forum) ->
        today = forum.todayByPost ? new Date()
        now   = new Date()
        if(today.getFullYear() is now.getFullYear() and today.getMonth() is now.getMonth() and today.getDate() is now.getDate())
          return forum.todayPostCount ? 0
        else
          return 0

      getCommentCount: (forum) ->
        today = forum.todayByComment ? new Date()
        now   = new Date()
        if(today.getFullYear() is now.getFullYear() and today.getMonth() is now.getMonth() and today.getDate() is now.getDate())
          return forum.todayCommentCount ? 0
        else
          return 0
</script>


<style lang="less">
  .forum-tab-bar{
    position: relative;
    top: 1px;
    justify-content: space-between !important;
    .tab{
      flex: auto;
      justify-content: center;
      padding: 12px;
      font-weight: 500;
      border-bottom: 1px solid transparent;
      .label{
        font-size: 14px;
        color: #A2AEBA;
      }
      .count{
        margin-left: 4px;
        font-size: 12px;
        color: #d9534f;
        opacity: 0.3;
        &::before{
          content: "+";
        }
      }
    }
    .tab.-active{
      font-weight: 600;
      border-bottom: 1px solid #445669;
      .label{
        color: #445669;
      }
      .count{
        color: #d9534f;
        opacity: 0.9;
      }
    }
  }
</style>