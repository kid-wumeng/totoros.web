<template lang="jade">
  #subjects-id-overview
    .row.-left.-top
      .left
        face(:subject="subject")
        c-base(:subject="subject")
      .right
        score-card(:subject="subject")
        c-mark(v-if="checkined", :subject="subject")
        intro(:subject="subject")
        resources(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':       require('./face')
      'c-base':     require('./base')
      'score-card': require('./score-card')
      'c-mark':     require('./mark')
      'intro':      require('./intro')
      'resources':  require('./resources')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #subjects-id-overview{
    margin-top: 4px;
    >.row{
      >.left{
        width: 200px;
        >*{
          margin-bottom: 20px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
      >.right{
        width: 500px;
        flex: auto;
        margin-left: 20px;
        display: flex;
        flex-direction: column;
        >*{
          margin-bottom: 20px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
    }
  }
</style>
