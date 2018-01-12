<template lang="jade">
  .mark-list
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark", :showSubject="true" showActions showResources)
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
      padding: 20px 16px;
      border-bottom: 1px solid rgb(240, 240, 240);
    }
    .mark-item:last-child{
      border-bottom: none;
    }
  }
</style>