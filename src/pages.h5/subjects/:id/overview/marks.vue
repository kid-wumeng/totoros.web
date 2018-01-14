<template lang="jade">
  detail-area.marks(v-if="marks.length" title="标记")
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'mark-item':   require('components.h5/mark-item')

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
      padding: 20px;
      border-bottom: 1px dashed rgb(240, 240, 240);
      &:first-child{
        border-top: 1px solid rgb(240, 240, 240);
      }
    }
  }
</style>