<template lang="jade">
  .input-tag
    .tag.row(v-for="tag in tags")
      .label {{ tag }}
      .icon.fa-close(@click="$emit('del', tag)")
</template>


<script lang="coffee">
  module.exports =
    props:
      'tags':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .input-tag{
    display: flex;
    flex-wrap: wrap;
    margin-top: -6px;
    .tag{
      box-sizing: border-box;
      height: 34px;
      padding: 0 10px;
      border: 1px solid #F2F2F2;
      border-radius: 3px;
      margin-top: 6px;
      margin-right: 6px;
      &:last-child{
        margin-right: 0;
      }
      .label{
        font-weight: 600;
        color: #707C88;
      }
      .icon{
        margin-left: 8px;
        color: #CCC;
        cursor: pointer;
      }
    }
  }
</style>
