<template lang="jade">
  #persons-id-overview
    .row.-left.-top
      .left
        face(:person="person")
        c-base(:person="person")
      .right
        intro(:person="person")
        casts(:person="person")
        staffs(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':   require('./face')
      'c-base': require('./base')
      'intro':  require('./intro')
      'casts':  require('./casts')
      'staffs': require('./staffs')

    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #persons-id-overview{
    >.row{
      >.left{
        width: 220px;
        >*{
          margin-bottom: 50px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
      >.right{
        width: 500px;
        flex: auto;
        margin-left: 24px;
        display: flex;
        flex-direction: column;
        >*{
          margin-bottom: 50px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
    }
  }
</style>
