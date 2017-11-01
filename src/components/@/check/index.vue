<template lang="jade">
  row.check.-center(:class="{'-active': active}" @click.native="$emit('change', !active)")
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
    cursor: pointer;
    user-select: none;
    .icon{
      height: 20px;
      line-height: 20px;
      font-size: 20px;
      color: #A2AEBA;
    }
    .label{
      height: 20px;
      line-height: 20px;
      margin-left: 4px;
      font-size: 14px;
      color: #A2AEBA;
    }
  }
  .check.-active{
    .icon{
      color: #445669;
    }
    .label{
      font-weight: 600;
      color: #445669;
    }
  }
</style>