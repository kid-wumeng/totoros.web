<template lang="jade">
  .search(@click="search")
    .icon.fa-search
    span
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
    width: 160px;
    height: 26px;
    line-height: 26px;
    padding: 0 10px;
    cursor: pointer;
    border-radius: 100px;
    box-shadow: 0 0 5px -3px #000;
    .icon{
      display: inline;
      color: #C3CCD4;
    }
    span{
      margin-left: 8px;
      font-size: 12px;
      color: #777;
    }
  }
</style>
