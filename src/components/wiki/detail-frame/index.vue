<template lang="jade">
  .detail-frame
    .row.-left
      slot.name(name="name")
      slot.desc(name="desc")
    .tab-bar-wrap
      slot.tab-bar(name="tab-bar")
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
        font-weight: 600;
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    >.tab-bar-wrap{
      width: 100%;
      margin-top: 12px;
      border-bottom: 1px solid rgba(245, 245, 245, 1);
      >.tab-bar{
        margin: 0 auto;
        width: 1000px;
      }
    }
    >.row:last-child{
      width: 1000px;
      margin-top: 12px;
      >.main{
        box-sizing: border-box;
        width: 750px;
      }
      >.side{
        width: 160px;
      }
    }
  }
</style>
