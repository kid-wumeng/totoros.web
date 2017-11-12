<template lang="jade">
  row.head.-between.-center
    row.left.-center
      user-name(:user="user")
      c-desc(:feed="feed")
    row.right.-center
      .date {{ model.date.display(feed.createDate) }}
      action-sheet(v-if="isMe(feed.user)", :actions="actions")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name':    require('components/user/user-name')
      'action-sheet': require('components/@/action-sheet')
      'c-desc':       require('./desc')

    props:
      'feed':
        type: Object
        required: true

    data: ->
      actions: [{
        label: '删除本条动态'
        click: => @remove()
      }]

    computed:
      user: -> @feed.user

    methods:
      remove: ->
        await @api.call('feed.remove', @feed.id)
        @commit('REMOVE_FEED', @feed)
</script>


<style lang="less" scoped>
  .head{
    box-sizing: border-box;
    padding: 0 16px;
    height: 48px;
    border-bottom: 1px solid #EEE;
    >.right{
      flex: none;
    }
    .user-face{
      width: 40px;
    }
    .user-name{
      flex: none;
      font-size: 14px;
      color: #5B6F84;
    }
    .desc{
      flex: auto;
    }
    .date{
      flex: none;
      font-size: 13px;
      color: #A2AEBA;
    }
    .action-sheet{
      margin-left: 12px;
    }
  }
</style>