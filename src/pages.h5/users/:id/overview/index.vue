<template lang="jade">
  #user-detail-overview
    intro(:user="user")
    animes(:user="user")
    comics(:user="user")
    games(:user="user")
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
    margin: 0 auto;
    margin-top: -45px;
    padding-top: 20px;
    >*{
      margin-bottom: 32px;
    }
  }
</style>