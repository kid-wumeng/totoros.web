<template lang="jade">
  detail-area.marks(v-if="marks.length" title="标记")
    .wrap
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
    .wrap{
      background-color: rgba(249, 249, 249, 1);
      overflow: hidden;
      .mark-item{
        padding: 20px;
        background-color: #FFF;
        margin-bottom: 6px;
        &:last-child{
          margin-bottom: 0;
        }
      }
      .mark-item:first-child{
        padding-top: 12px;
      }
    }
  }
</style>