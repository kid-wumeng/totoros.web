<template lang="jade">
  .navigator
    router-link.item(to="/", :class="{'-active': $route.path === '/'}") 讨论版
    .item(@click="clickMarks", :class="{'-active': $route.path === '/marks'}") MARKS
    router-link.item(v-if="admin" to="/wiki", :class="{'-active': $route.path === '/wiki'}") 维基
</template>


<script lang="coffee">
  module.exports =
    computed:
      isForum: ->
        return /^\/forums\//.test(@$route.path)

    methods:
      clickMarks: (e) ->
        if(@$route.path isnt '/marks')
          @commit('RESET_MARKS')
          @$router.push('/marks')
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 36px;
    .item{
      display: inline-block;
      height: 64px;
      line-height: 64px;
      padding: 0 20px;
      font-size: 14px;
      font-weight: 500;
      color: #A2AEBA;
      cursor: pointer;
      user-select: none;
    }
    >.item.-active{
      color: #273340;
      cursor: auto;
    }
  }
</style>
