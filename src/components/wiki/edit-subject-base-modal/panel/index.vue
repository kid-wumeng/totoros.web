<template lang="jade">
  .panel(v-if="subject")
    h1 编辑作品词条：{{ subject.name }}
    .row
      left(:subject="subject")
      right(:subject="subject", :records="records")
</template>


<script lang="coffee">
  module.exports =
    components:
      'left':  require('./left')
      'right': require('./right')

    data: ->
      subject: null
      records: []

    created: ->
      sid = @state['edit-subject-base-modal'].sid
      api.call('subject.get', sid).done (@subject) =>
      api.call('subject.getEditBaseRecords', sid).done (@records) =>
</script>


<style lang="less" scoped>
  .panel{
    box-sizing: border-box;
    height: 100%;
    padding-top: 96px;
    position: relative;
    h1{
      position: absolute;
      top: 30px;
      width: 100%;
      text-align: center;
      font-size: 20px;
    }
    .row{
      height: 100%;
      .right{
        border-left: 1px solid #F2F2F2;
      }
    }
  }
</style>
