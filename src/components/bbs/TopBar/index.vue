<template lang="jade">
  .top-bar
    c-image(path="banner-test?123" cover)
    tab-bar(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/Image')
      'tab-bar': require('components/@/TabBar')

    props:
      'active':
        type: String
        required: true

    data: ->
      tabs: [{
        label: 'ACG自由讨论'
        value: 'acg'
      },{
        label: '一起看动画'
        value: 'animes'
      },{
        label: '一起看漫画'
        value: 'comics'
      },{
        label: '手绘达人'
        value: 'paints'
      }]

    methods:
      change: (tab) -> @$router.push(tab.value)
</script>


<style lang="less">
  .top-bar{
    .image{
      width: 100%;
      height: 160px;
    }
    .tab-bar{
      position: relative;
      top: -20px;
      margin: 0 auto;
      width: 800px;
      .tab{
        height: 36px;
        padding: 0 16px;
        font-weight: 600;
        background-color: rgba(250, 250, 250, 0.93);
        border: 1px solid #FFF;
        box-shadow: 0 0 6px -3px #000;
        margin-right: 12px;
        transition: all 0.2s ease;
        .label{
          transition: all 0.2s ease;
          color: #BBB;
        }
      }
      .tab.-active{
        background-color: #FFF;
        .label{
          color: #445669;
        }
      }
    }
  }
</style>
