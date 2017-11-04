<template lang="jade">
  #clubs-id
    row(v-if="cid && club")
      .left
        row.-between.-center
          c-base(:club="club")
          action-bar(:club="club")
        post-list(:club="club")
      .right
        router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':     require('./base')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')

    data: ->
      club: null

    computed:
      cid: -> @$route.params.cid

    methods:
      init: ->
        if(@cid)
          @club = await api.call('club.get', parseInt(@cid))
</script>


<style lang="less" scoped>
  #clubs-id{
    flex: auto;
    border-top: 1px solid rgba(245, 245, 245, 0.9);
    .left{
      flex: none;
      box-sizing: border-box;
      padding: 24px;
      width: 400px;
      border-right: 1px solid rgba(245, 245, 245, 0.9);
    }
    .right{
      flex: auto;
      box-sizing: border-box;
      padding: 24px;
      background-color: #FFF;
    }
  }
</style>