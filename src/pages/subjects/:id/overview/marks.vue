<template lang="jade">
  detail-box.marks(v-if="marks.length" title="标记")
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark", :showUser="true")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/wiki/detail-box')
      'mark-item':  require('components/user/mark-item')

    props:
      'subject':
        type: Object
        required: true

    computed:
      marks: -> @subject.marks ? []
</script>


<style lang="less" scoped>
  .marks{
    .mark-item{
      box-sizing: border-box;
      padding: 16px 16px;
      &:nth-child(even){
        background-color: rgb(250, 250, 250);
      }
    }
  }
</style>