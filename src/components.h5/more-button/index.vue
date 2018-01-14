<template lang="jade">
  .more-button(v-if="hasMorePage", @click="click") 加载更多帖子
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
  }
</style>