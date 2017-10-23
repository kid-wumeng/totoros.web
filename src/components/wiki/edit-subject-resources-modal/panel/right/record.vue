<template lang="jade">
  .edit-base-record.row.-top.-left
    .left
      .edit-date {{ model.date.display(record.editDate) }}
    .right
      .desc.row.-left
        user-name(:user="record.user")
        .verb {{ verb }}了Link
      div.url(v-if="type === 'add'") {{ url }}
      del.url(v-else) {{ url }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')

    props:
      'record':
        type: Object
        required: true

    computed:
      type:     -> @record.type
      resource: -> @record.resource
      url:      -> @resource?.url

      verb: ->
        switch @record.type
          when 'add'    then '添加'
          when 'delete' then '删除'
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
      .url{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 5px;
        font-size: 13px;
      }
      del.url{
        color: #BBB;
      }
    }
  }
</style>
