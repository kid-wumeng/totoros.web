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
    padding: 8px 16px;
    text-align: center;
    border: 1px solid #E4E8EB;
    border-radius: 3px;
    user-select: none;
    color: #A2AEBA;
    cursor: pointer;
    transition: all 0.2s ease;
    &:hover{
      color: darken(#A2AEBA, 25%);
      border: 1px solid #A2AEBA;
    }
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