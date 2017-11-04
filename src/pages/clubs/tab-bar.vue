<template lang="jade">
  .tab-bar
    cdn-image(path="assets/club-banner?2017-11-04" cover)
    tab-bar.club-tab-bar(:tabs="tabs", :active="routeID", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
      'tab-bar':   require('components/@/tab-bar')

    data: ->
      clubs: []

    computed:
      tabs: ->
        return @clubs.map (club) ->
          return
            label: club.name
            value: club.id

    methods:
      init: ->
        @clubs = await api.call('club.getAll')

      change: (tab) ->
        @$router.replace('/clubs/' + tab.value)
</script>


<style lang="less">
  .tab-bar{
    .cdn-image{
      width: 100%;
      height: 200px;
    }
    .club-tab-bar{
      position: relative;
      top: -20px;
      margin: 0 auto;
      width: 800px;
      .tab{
        height: 35px;
        line-height: 34px;
        padding: 0 16px;
        font-weight: 600;
        background-color: rgba(250, 250, 250, 0.93);
        border: 1px solid #FFF;
        box-shadow: 0 0 6px -3px #000;
        margin-right: 12px;
        transition: all 0.2s ease;
        .label{
          transition: all 0.2s ease;
          font-size: 14px;
          color: #707C88;
        }
      }
      .tab.-active{
        font-weight: 600;
        background-color: rgba(68, 86, 105, 0.93);
        border-color: transparent;
        .label{
          color: #FFF;
        }
      }
    }
  }
</style>
