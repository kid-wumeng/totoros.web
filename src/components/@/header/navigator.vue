<template lang="jade">
  .navigator
    .item(@click="$router.push('/')") 讨论版
    .item(@click="toMarks") MARKS
    .item(v-if="admin" @click="$router.push('/wiki')") 维基计划
</template>


<script lang="coffee">
  module.exports =
    computed:
      isForum: ->
        return /^\/forums\//.test(@$route.path)

    methods:
      toMarks: ->
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
