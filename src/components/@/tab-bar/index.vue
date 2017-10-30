<template lang="jade">
  .tab-bar
    .tab.row(v-for="tab in tabs", :class="{'-active': tab.value === active}" @click="$emit('change', tab)")
      .label {{ tab.label }}
      .count(v-if="tab.count") {{ tab.count }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'tabs':
        type: Array
        required: true
      'active':
        type: String
        required: true
</script>


<style lang="less" scoped>
  .tab-bar{
    box-sizing: border-box;
    .tab{
      box-sizing: border-box;
      cursor: pointer;
    }
    .tab.-active{
      cursor: default;
    }
  }
</style>
