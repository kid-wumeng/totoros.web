<template lang="jade">
  detail-area.marks(v-if="marks.length" title="标记")
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark", :showUser="true")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components/wiki/detail-area')
      'mark-item':   require('components/user/mark-item')

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
      padding: 16px 12px;
      border-bottom: 1px dashed rgb(240, 240, 240);
    }
  }
</style>