<template lang="jade">
  tab-bar.detail-tab-bar.row.-left(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('components/@/tab-bar')

    props:
      'tabs':
        type: Array
        required: true
      'active':
        type: String
        required: true

    methods:
      change: (tab) -> @$emit('change', tab)
</script>


<style lang="less">
  .detail-tab-bar{
    .tab{
      margin-right: 16px;
      height: 20px;
      line-height: 20px;
      .label{
        color: #BBB;
      }
      .count{
        color: #BBB;
        margin-left: 4px;
      }
    }
    .tab.-active{
      font-weight: 600;
      .label{
        color: #445669;
      }
      .count{
        color: #445669;
      }
    }
  }
</style>
