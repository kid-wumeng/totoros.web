<template lang="jade">
  row.mark-item-simple
    .left
      user-face(:user="mark.user")
    .right
      row.-center
        user-name(:user="mark.user")
        mark-score-simple(:mark="mark")
      text-area.comment(:text="comment")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':         require('components/image/user-face')
      'user-name':         require('components/user/user-name')
      'mark-score-simple': require('components/user/mark-score-simple')
      'text-area':         require('components/@/text-area')

    props:
      'mark':
        type: Object
        required: true

    computed:
      comment: -> @mark.comment ? ''
</script>


<style lang="less" scoped>
  .mark-item-simple{
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 11px;
      margin-top: -1px;
    }
    .user-face{
      width: 40px;
    }
    .user-name{
      flex: none;
      font-size: 13px;
    }
    .mark-score-simple{
      margin-left: 8px;
    }
    .comment{
      margin-top: 6px;
      line-height: 19px;
      font-size: 13px;
    }
  }
</style>