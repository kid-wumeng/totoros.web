<template lang="jade">
  row.head.-between.-center
    .row.left
      user-name(:user="user")
      c-desc(:feed="feed")
    .right
      .date {{ model.date.display(feed.createDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')
      'c-desc':    require('./desc')

    props:
      'feed':
        type: Object
        required: true

    computed:
      user: -> @feed.user
</script>


<style lang="less" scoped>
  .head{
    box-sizing: border-box;
    padding: 0 12px;
    height: 36px;
    border-bottom: 1px solid #EEE;
    >.right{
      flex: none;
    }
    .user-name{
      flex: none;
      font-size: 13px;
      font-weight: 500;
      color: #445669;
    }
    .desc{
      flex: auto;
    }
    .date{
      flex: none;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>