<template lang="jade">
  .panel
    h1 编辑作品词条：{{ subject.name }}
    .row
      left
      right
</template>


<script lang="coffee">
  module.exports =
    components:
      'left':  require('./left')
      'right': require('./right')

    computed:
      subject: -> @state['edit-subject-resources-modal'].subject
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
      box-sizing: border-box;
      height: 100%;
      .right{
      }
    }
  }
</style>