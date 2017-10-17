<template lang="jade">
  .mark-list
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-item': require('components/user/mark-item')

    props:
      'marks':
        type: Array
        default: []
</script>


<style lang="less" scoped>
  .mark-list{
    @padding: 8px;
    @border: 1px solid #EAEAEA;
    .mark-item{
      padding-left: @padding;
      padding-right: @padding;
      padding-top:  @padding;
      border-bottom:  @border;
      padding-bottom: @padding + 1;
      &:first-child{
        border-top: @border;
      }
      &:nth-child(odd){
      }
    }
  }
</style>