<template lang="jade">
  #user-detail-overview
    row
      .left
        intro(:user="user")
        done-animes(:user="user")
        done-comics(:user="user")
        done-games(:user="user")
      .right
        doing-marks(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'intro':       require('./intro')
      'done-animes': require('./done-animes')
      'done-comics': require('./done-comics')
      'done-games':  require('./done-games')
      'done-marks':  require('./done-marks')
      'doing-marks': require('./doing-marks')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-overview{
    padding-top: 20px;
    .left{
      width: 65%;
      >*{
        margin-bottom: 60px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
    .right{
      box-sizing: border-box;
      margin-left: 50px;
      >*{
        margin-bottom: 24px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>