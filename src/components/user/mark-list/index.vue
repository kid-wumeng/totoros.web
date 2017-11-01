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
        default: -> []
</script>


<style lang="less" scoped>
  .mark-list{
    @padding: 8px;
    .mark-item{
      padding-left: @padding;
      padding-right: @padding;
      padding-top:  @padding;
      padding-bottom: @padding + 1;
      &:nth-child(even){
        background-color: #FFF;
      }
    }
  }
</style>