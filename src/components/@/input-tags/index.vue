<template lang="jade">
  .input-tags
    .flow
      .tag.row(v-for="(tag, index) in tags", :key="index")
        .label {{ label(tag) }}
        .icon.fa-close(@click="$emit('del', index)")
</template>


<script lang="coffee">
  module.exports =
    model:
      prop:  'tags'
      event: 'change'

    props:
      'tags':
        type: Array
        default: -> []
      'name':
        type: String
        default: ''


    methods:
      label: (tag) -> tag[@name]
</script>


<style lang="less" scoped>
  .input-tags{
    box-sizing: border-box;
    min-height: 34px;
    .flow{
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
  }
</style>
