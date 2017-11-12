<template lang="jade">
  .forum
    cdn-image(path="banner-test?123" cover)
    tab-bar.forum-tab-bar(:tabs="tabs", :active="path", @change="change")
    .wrap
      forum-action-bar(:id="id")
      post-list(:id="id")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image':        require('components/image/cdn-image')
      'tab-bar':          require('components/@/tab-bar')
      'forum-action-bar': require('components/bbs/forum-action-bar')
      'post-list':        require('components/bbs/post-list')


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

    computed:
      path: ->
        return @$route.path.slice(1)

      id: ->
        switch @path
          when 'acg'    then 1
          when 'animes' then 2
          when 'comics' then 3
          when 'paints' then 4
          else 0

    methods:
      change: (tab) -> @$router.replace(tab.value)
</script>


<style lang="less">
  .forum{
    .cdn-image{
      width: 100%;
      height: 160px;
    }
    .forum-tab-bar{
      position: relative;
      top: -20px;
      margin: 0 auto;
      width: 800px;
      .tab{
        height: 36px;
        line-height: 36px;
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
    .wrap{
      margin: 0 auto;
      padding: 12px;
      width: 800px;
      border: 1px solid #FFF;
      border-radius: 3px;
      box-shadow: 0 0 6px -3px #000;
    }
  }
</style>
