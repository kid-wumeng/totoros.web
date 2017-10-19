<template lang="jade">
  .head.row
    .left.row.-left
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
    padding: 0 16px;
    height: 36px;
    border-bottom: 1px solid #EEE;
    .user-name{
      font-size: 13px;
      color: #445669;
    }
    .date{
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>