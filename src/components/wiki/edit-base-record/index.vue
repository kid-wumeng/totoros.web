<template lang="jade">
  .edit-base-record.row.-top.-left
    .left
      .edit-date {{ model.date.display(record.editDate) }}
    .right
      .desc.row.-left
        user-name(:user="record.user")
        .verb 编辑了{{ model.subject.displayKey(record.key) }}
      .value
        del.old-value {{ record.oldValue }}
        .new-value {{ record.newValue }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')

    props:
      'record':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .edit-base-record{
    margin-bottom: 12px;
    .left{
      width: 80px;
      text-align: right;
      .edit-date{
        font-size: 13px;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      padding-bottom: 12px;
      border-bottom: 1px solid #F2F2F2;
      .desc{
        .user-name{
          font-size: 13px;
        }
        .verb{
          margin-left: 6px;
          font-size: 13px;
        }
      }
      .value{
        .old-value{
          display: block;
          margin-top: 5px;
          font-size: 13px;
          color: #BBB;
        }
        .new-value{
          margin-top: 5px;
          font-weight: 500;
          font-size: 13px;
        }
      }
    }
  }
</style>
