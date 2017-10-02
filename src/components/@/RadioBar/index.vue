<template lang="jade">
  .radio-bar.row
    .radio.-center(v-for="radio in radios", :class="{'-active': radio.value === active}", @click="$emit('change', radio)")
      .label {{ radio.label }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'radios':
        type: Array
        required: true
        desc: 'radio={ label, value }'
      'active':
        type: String
        default: ''
</script>


<style lang="less" scoped>
  .radio-bar{
    box-sizing: border-box;
    height: 32px;
    background-color: #FFF;
    border: 1px solid rgb(209, 213, 218);
    border-radius: 3px;
    .radio{
      align-self: stretch;
      flex: auto;
      font-size: 14px;
      border-right: 1px solid rgb(209, 213, 218);
      cursor: pointer;
      &:last-child{
        border-right: none;
      }
      .label{
        font-weight: 400;
        color: #BBB;
      }
    }
    .radio.-active{
      background-color: #fafbfc;
      box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
      cursor: default;
      .label{
        font-weight: 600;
        color: #445669;
      }
    }
  }
</style>
