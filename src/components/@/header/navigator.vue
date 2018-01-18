<template lang="jade">
  .navigator
    router-link.item(to="/") 讨论版
    .item(@click="clickMarks") MARKS
    router-link.item(v-if="admin" to="/wiki") 维基
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
      font-weight: 600;
      color: #445669;
      cursor: pointer;
      user-select: none;
    }
  }
</style>
