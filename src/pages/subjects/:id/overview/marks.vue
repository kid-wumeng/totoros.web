<template lang="jade">
  detail-area.marks(v-if="marks.length" title="标记")
    mark-item-simple(v-for="mark in marks", :key="mark.id", :mark="mark" showUser)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components/wiki/detail-area')
      'mark-item-simple':   require('components/user/mark-item-simple')

    props:
      'subject':
        type: Object
        required: true

    computed:
      marks: -> @subject.marks ? []
</script>


<style lang="less" scoped>
  .marks{
    .mark-item-simple{
      padding: 12px;
      &:nth-child(odd){
        background-color: rgba(250, 250, 250, 0.93);
      }
    }
  }
</style>