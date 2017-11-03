<template lang="jade">
  .search(@click="search")
    .icon.fa-search
    span Totoros成员 / ACG词条
</template>


<script lang="coffee">
  module.exports =
    methods:
      search: ->
        @dispatch('search-modal/show', {
          allowType: null
          redirect: true
        })
</script>


<style lang="less" scoped>
  .search{
    margin-left: 24px;
    width: 200px;
    height: 26px;
    line-height: 26px;
    padding: 0 10px;
    cursor: pointer;
    border: 1px solid #FFF;
    border-radius: 100px;
    box-shadow: 0 0 6px -3px #000;
    .icon{
      display: inline;
      color: #C3CCD4;
    }
    span{
      margin-left: 8px;
      font-weight: bold;
      font-size: 12px;
      color: #C1C8CF;
    }
  }
</style>
