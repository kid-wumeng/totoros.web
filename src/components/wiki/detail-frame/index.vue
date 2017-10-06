<template lang="jade">
  .detail-frame
    .row.-left
      slot.name(name="name")
      slot.desc(name="desc")
    slot.tab-bar(name="tab-bar")
    c-line
    .row.-top
      .main: slot(name="main")
      .side: slot(name="side")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-line': require('components/@/line')
</script>


<style lang="less">
  .detail-frame{
    box-sizing: border-box;
    width: 100%;
    min-height: 100%;
    padding: 20px 0;
    background-color: #FFF;
    display: flex;
    flex-direction: column;
    align-items: center;
    >.row:first-child{
      width: 1000px;
      >.name{
        font-weight: 600;
        font-size: 18px;
      }
      >.desc{
        margin-left: 9px;
        font-size: 13px;
      }
    }
    >.tab-bar{
      width: 1000px;
      margin-top: 12px;
    }
    >.line{
      margin-top: 12px;
      color: #EEE;
    }
    >.row:last-child{
      width: 1000px;
      margin-top: 12px;
      >.main{
        box-sizing: border-box;
        width: 700px;
      }
      >.side{
        width: 200px;
      }
    }
  }
</style>
