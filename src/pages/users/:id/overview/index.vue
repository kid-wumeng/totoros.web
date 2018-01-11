<template lang="jade">
  #user-detail-overview
    row
      .left
        intro(:user="user")
        animes(:user="user")
        comics(:user="user")
        games(:user="user")
      .right
        mark-feeds(:user="user")
        posts(:user="user")
        comment-posts(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'intro':         require('./intro')
      'animes':        require('./animes')
      'comics':        require('./comics')
      'games':         require('./games')
      'mark-feeds':    require('./mark-feeds')
      'posts':         require('./posts')
      'comment-posts': require('./comment-posts')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-overview{
    width: 1000px;
    margin: 0 auto;
    padding-top: 20px;
    .left{
      width: 70%;
      >*{
        margin-bottom: 70px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
    .right{
      width: 30%;
      box-sizing: border-box;
      padding-left: 50px;
      >*{
        margin-bottom: 24px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>