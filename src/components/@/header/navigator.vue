<template lang="jade">
  .navigator
    router-link.item(to="/", :class="{'-active': activeBBS()}") 讨论版
    a.item(@click.prevent="clickMarks", to="/marks", :class="{'-active': $route.path === '/marks'}") MARKS
    router-link.item(v-if="admin" to="/wiki", :class="{'-active': $route.path === '/wiki'}") 维基计划
</template>


<script lang="coffee">
  module.exports =
    computed:
      isForum: ->
        return /^\/forums\//.test(@$route.path)

    methods:
      activeBBS: ->
        return @$route.path is '/' or /^\/forums/.test(@$route.path)

      clickMarks: (e) ->
        if(@$route.path isnt '/marks')
          @commit('RESET_MARKS')
          @$router.push('/marks')
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 40px;
    .item{
      display: inline-block;
      height: 64px;
      line-height: 64px;
      padding: 0 16px;
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
      cursor: pointer;
      user-select: none;
    }
    >.item.-active{
      color: #445669;
      cursor: auto;
    }
  }
</style>
