<template lang="jade">
  .edit-base-record.row.-top.-left
    .left
      .date {{ model.date.display(record.editDate) }}
    .right
      .desc.row.-left
        user-name(:user="record.user")
        .verb 编辑了{{ model.subject.displayKey(record.key) }}
      div.value(v-if="record.newValue") {{ record.newValue }}
      del.value(v-if="record.oldValue") {{ record.oldValue }}
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
    padding: 16px 20px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    .left{
      width: 80px;
      text-align: right;
      .date{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      .desc{
        .user-name{
          font-size: 13px;
        }
        .verb{
          margin-left: 6px;
          font-size: 13px;
          color: #A2AEBA;
        }
      }
      .value{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 6px;
        font-weight: 600;
        font-size: 13px;
      }
      del.value{
        color: #CCC;
        font-weight: 400;
      }
    }
  }
</style>
