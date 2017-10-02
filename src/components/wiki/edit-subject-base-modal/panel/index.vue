<template lang="jade">
  .panel
    h1 编辑词条：{{ subject.name }}
    .row
      left(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'left': require('./left')

    data: ->
      subject: @state['edit-subject-base-modal'].subject
</script>


<style lang="less" scoped>
  .panel{
    box-sizing: border-box;
    height: 100%;
    padding: 40px;
    padding-top: 70px;
    position: relative;
    h1{
      position: absolute;
      top: 20px;
      width: 100%;
      text-align: center;
      font-size: 20px;
    }
    .row{
      height: 100%;
    }
  }
</style>
