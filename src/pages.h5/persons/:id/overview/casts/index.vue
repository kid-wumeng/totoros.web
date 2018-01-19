<template lang="jade">
  detail-area.casts(v-if="casts.length" title="CAST")
    item(v-for="cast in casts", :key="cast.id", :cast="cast")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'item':        require('./item')

    props:
      'person':
        type: Object
        required: true

    computed:
      casts: -> @person.casts ? []
</script>


<style lang="less" scoped>
  .casts{
    .wrap{
      background-color: rgba(249, 249, 249, 1);
      overflow: hidden;
      .item{
        padding: 20px;
        background-color: #FFF;
        margin-top: 6px;
      }
    }
  }
</style>