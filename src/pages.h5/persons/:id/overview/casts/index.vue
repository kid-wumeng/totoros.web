<template lang="jade">
  detail-area.casts(v-if="casts.length" title="CAST")
    .wrap(:class="wrapClass")
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
      'showSep':
        type: Boolean
        default: false

    computed:
      casts: -> @person.casts ? []

      wrapClass: ->
        '-showSep': @showSep
</script>


<style lang="less" scoped>
  .casts{
    .wrap{
      background-color: rgba(249, 249, 249, 1);
      overflow: hidden;
      .item{
        padding: 20px;
        background-color: #FFF;
        margin-bottom: 6px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
    .wrap.-showSep{
      .item:last-child{
        margin-bottom: 6px;
      }
    }
  }
</style>