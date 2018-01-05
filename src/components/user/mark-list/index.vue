<template lang="jade">
  .mark-list
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark", :showSubject="true")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-item': require('components/user/mark-item')

    props:
      'marks':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .mark-list{
    .mark-item{
      padding: 30px 20px;
      border-bottom: 1px dashed rgb(221, 221, 221);
    }
    .mark-item:last-child{
      border-bottom: none;
    }
  }
</style>