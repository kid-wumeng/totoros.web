<template lang="jade">
  .edit-side-bar
    tab-bar(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('components/@/TabBar')

    props:
      'tabs':
        type: Array
        required: true
      'active':
        type: String
        required: true

    methods:
      change: (tab) ->
        @$router.replace(tab.value)
</script>


<style lang="less">
  .edit-side-bar{
    align-self: stretch;
    box-sizing: border-box;
    padding: 6px;
    width: 100px;
    background-color: #445669;
    .tab-bar{
      .tab{
        height: 50px;
        justify-content: center;
        border-radius: 3px;
        margin-bottom: 12px;
        .label{
          font-weight: 600;
          font-size: 14px;
          color: #AAA;
        }
      }
      .tab.-active{
        background-color: #FFF;
        .label{
          font-weight: 600;
          color: #445669;
        }
      }
    }
  }
</style>
