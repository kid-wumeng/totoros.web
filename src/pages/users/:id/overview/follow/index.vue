<template lang="jade">
  .follow
    detail-box(:title="title")
      .wrap
        router-link.action(:to="getUserPath(user, 'idols')") 关注 {{ user.idolCount }} 人
        router-link.action(:to="getUserPath(user, 'fans')") 粉丝 {{ user.fanCount }} 人
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/user/detail-box')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "加入于 #{@model.date.display(@user.createDate)}"
</script>


<style lang="less" scoped>
  .follow{
    .wrap{
      padding: 8px;
      .action{
        padding: 6px 8px;
        text-align: left;
        font-weight: 500;
        font-size: 13px;
        cursor: pointer;
        border-radius: 3px;
        &:hover{
          color: #FFF;
          background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
        }
      }
    }
  }
</style>