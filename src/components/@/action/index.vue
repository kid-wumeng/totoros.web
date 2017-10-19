<template lang="jade">
  .action(@click="$emit('click')")
    .icon(:class="icon")
    .label(v-if="label") {{ label }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'icon':
        type: String
        default: ''
      'label':
        type: String
        default: ''
</script>


<style lang="less" scoped>
  .action{
    padding: 0 13px;
    text-align: center;
    border-radius: 3px;
    user-select: none;
    cursor: pointer;
    color: inherit;
    .icon{
      height: 16px;
      font-size: 14px;
      font-weight: 600;
      color: inherit;
    }
    .label{
      margin-top: 2px;
      height: 16px;
      line-height: 16px;
      font-size: 12px;
      font-weight: 600;
      color: inherit;
    }
  }
</style>