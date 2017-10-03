<template lang="jade">
  .right
    .desc 本词条创建于 {{ model.date.display(subject.createDate) }}
    edit-base-record(v-for="(record, index) in records", :key="index", :record="record")
</template>


<script lang="coffee">
  module.exports =
    components:
      'edit-base-record': require('components/wiki/edit-base-record')

    props:
      'subject':
        type: Object
        required: true
      'records':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .right{
    box-sizing: border-box;
    width: 570px;
    height: 100%;
    padding: 0 70px 0 30px;
    overflow: scroll;
    .desc{
      text-align: center;
      font-weight: 600;
      margin-bottom: 18px;
    }
  }
</style>
