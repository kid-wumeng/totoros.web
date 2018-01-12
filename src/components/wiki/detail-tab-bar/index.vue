<template lang="jade">
  tab-bar.detail-tab-bar.subject-detail-tab-bar(:tabs="tabs", :active="active", @change="change")
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
        default: null

    methods:
      change: (tab) -> @$emit('change', tab)
</script>


<style lang="less">
  .subject-detail-tab-bar{
    .tab{
      padding: 0 16px;
      height: 28px;
      line-height: 28px;
      font-weight: 600;
      border-radius: 3px 3px 0 0;
      user-select: none;
      .label{
        font-size: 13px;
        color: #CDD6E0;
      }
      .count{
        font-size: 13px;
        color: #A2AEBA;
        margin-left: 4px;
      }
    }
    .tab.-active{
      background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
      .label{
        color: #FFF;
      }
      .count{
        color: #FFF;
      }
    }
  }
</style>
