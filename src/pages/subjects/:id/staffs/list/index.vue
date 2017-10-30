<template lang="jade">
  .list
    item(v-for="(staff, index) in staffs", :key="index", :staff="staff")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    props:
      'staffs':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .list{
  }
</style>
