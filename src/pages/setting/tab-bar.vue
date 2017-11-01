<template lang="jade">
  tab-bar.setting-tab-bar.row.-left(:tabs="tabs", :active="$route.meta.path", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('components/@/tab-bar')

    computed:
      tabs: -> [{
        label: '个人档案'
        value: 'base'
      },{
        label: '密码'
        value: 'pass'
      },{
        label: '退出登录'
        value: 'logout'
      }]

    methods:
      change: (tab) ->
        @$router.replace(tab.value)
</script>


<style lang="less">
  .setting-tab-bar{
    margin-top: 12px;
    margin-bottom: 12px;
    .tab{
      padding: 0 10px;
      height: 30px;
      line-height: 20px;
      &:first-child{
        padding-left: 0;
      }
      .label{
        font-size: 15px;
        color: #A2AEBA;
      }
    }
    .tab.-active{
      font-weight: 600;
      .label{
        color: #445669;
      }
    }
  }
</style>