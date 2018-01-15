<template lang="jade">
  .more-button(v-if="hasMorePage", @click="click") 加载更多内容
</template>


<script lang="coffee">
  module.exports =
    props:
      'hasMorePage':
        type: Boolean
        required: false

    methods:
      click: ->
        @$emit('click')
</script>


<style lang="less" scoped>
  .more-button{
    height: 60px;
    line-height: 60px;
    text-align: center;
    font-size: 15px;
    font-weight: 500;
    color: #A2AEBA;
  }
</style>