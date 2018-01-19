<template lang="jade">
  row.item
    .left
      subject-face(:subject="subject" frame)
    .right
      row.right.-between.-center
        subject-name.-more(:subject="subject")
        role-name(:role="role")
      .importance {{ importance }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face': require('components/image/subject-face')
      'subject-name': require('components/wiki/subject-name')
      'role-name':    require('components/wiki/role-name')

    props:
      'cast':
        type: Object
        required: true

    computed:
      subject:    -> @cast.subject
      role:       -> @cast.role
      importance: -> model.cast.displayImportance(@cast.importance)
</script>


<style lang="less" scoped>
  .item{
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 10px;
    }
    .subject-face{
      width: 56px;
    }
    .subject-name{
      font-size: 14px;
    }
    .importance{
      margin-top: 2px;
      font-size: 13px;
      color: #A2AEBA;
    }
    .role-face{
      width: 20px;
    }
    .role-name{
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>