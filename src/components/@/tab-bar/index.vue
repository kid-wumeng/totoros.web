<template lang="jade">
  row.tab-bar
    a.tab(
      v-for="(tab, i) in tabs",
      :key="i",
      :href="href(tab)",
      :class="{'-active': tab.value === active}"
      @click.prevent="click(tab)"
    )
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
        default: null

    methods:
      href: (tab) -> if(tab.link) then tab.link else 'javascript:void(0);'

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
      display: flex;
      align-items: center;
    }
    .tab.-active{
      cursor: default;
    }
  }
</style>
