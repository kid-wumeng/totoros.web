<template lang="jade">
  .mark-item
    row.-center
      user-face(:user="mark.user" circle)
      user-name(:user="mark.user")
      .date {{ model.date.display(mark.createDate) }}
      .status {{ model.mark.displayStatus(mark.status, mark.subject.type) }}
    mark-score-simple(:mark="mark")
    text-area.comment(:text="mark.comment")
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
</script>


<style lang="less" scoped>
  .mark-item{
    box-sizing: border-box;
    .user-face{
      flex: none;
      width: 24px;
    }
    .user-name{
      margin-left: 8px;
      font-size: 12px;
    }
    .date{
      margin-left: 8px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .status{
      margin-left: 8px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .mark-score-simple{
      margin-top: 10px;
    }
    .comment{
      flex: none;
      margin-top: 9px;
      line-height: 19px;
      font-size: 13px;
      color: #707C88;
    }
  }
</style>