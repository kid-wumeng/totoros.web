<template lang="jade">
  .panel
    h1 编辑团体词条：{{ organization.name }}
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
      organization: -> @state['edit-organization-base-modal'].organization
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
