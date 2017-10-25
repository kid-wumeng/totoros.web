<template lang="jade">
  #user-detail-overview.row
    .left
      anime-marks(:user="user")
      comic-marks(:user="user")
    .right
</template>


<script lang="coffee">
  module.exports =
    components:
      'anime-marks': require('./anime-marks')
      'comic-marks': require('./comic-marks')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-overview{
    .left{
      width: 75%;
      >*{
        margin-bottom: 60px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
    .right{
      >*{
        margin-bottom: 20px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>