<template lang="jade">
  row.tab-bar
    row.tab(v-for="(tab, i) in tabs", :key="i", :class="{'-active': tab.value === active}" @click="click(tab)")
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
        type: null
        required: true

    methods:
      click: (tab) ->
        if tab.value isnt @active
          @$emit('change', tab)
</script>


<style lang="less">
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
