<template lang="jade">
  .search(@click="dispatch('search-modal/show', {allowType: null})")
    .icon.fa-search
</template>


<script lang="coffee">
  module.exports =
    data: -> {}
</script>


<style lang="less" scoped>
  .search{
    margin-left: 20px;
    font-weight: bold;
    cursor: pointer;
  }
</style>
