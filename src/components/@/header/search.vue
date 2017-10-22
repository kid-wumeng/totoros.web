<template lang="jade">
  .search(@click="search")
    .icon.fa-search
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
    margin-left: 20px;
    font-weight: bold;
    cursor: pointer;
  }
</style>
