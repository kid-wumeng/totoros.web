<template lang="jade">
  row.item
    .left
      subject-face(:subject="subject" frame)
    row.right.-between
      .left
        subject-name.-more(:subject="subject")
        .importance - {{ importance }} -
      row.right
        role-name(:role="role")
        role-face(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face': require('components/image/subject-face')
      'subject-name': require('components/wiki/subject-name')
      'role-face':    require('components/image/role-face')
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
    padding: 8px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    >.right{
      flex: auto;
      margin-left: 8px;
    }
    .subject-face{
      width: 56px;
    }
    .subject-name{
      font-size: 13px;
    }
    .importance{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .role-face{
      width: 32px;
    }
    .role-name{
      margin-right: 8px;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>