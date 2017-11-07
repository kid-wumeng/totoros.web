<template lang="jade">
  row.head.-between.-center
    row.left.-center
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
  }
</style>