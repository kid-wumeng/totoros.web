<template lang="jade">
  .check(:class="{'-active': active}" @click="$emit('change', !active)")
    .icon.fa-check-square-o
    .label {{ label }}
</template>


<script lang="coffee">
  module.exports =
    model:
      prop: 'active'
      event: 'change'

    props:
      'label':
        type: String
        default: ''
      'active':
        type: Boolean
        default: false
</script>


<style lang="less">
  .check{
    display: flex;
    align-items: center;
    cursor: pointer;
    user-select: none;
    .icon{
      font-size: 15px;
      color: #A2AEBA;
    }
    .label{
      margin-left: 4px;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
  .check.-active{
    .icon{
      font-weight: 600;
      color: #40C9A2;
    }
    .label{
      font-weight: 600;
      color: #40C9A2;
    }
  }
</style>