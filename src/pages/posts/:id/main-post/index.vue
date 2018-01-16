<template lang="jade">
  .main-post(v-if="routePage === 1")
    row.title-row.-between.-center
      .title {{ post.title }}
      .label 主题
    floor.content(:user="post.user", :content="post.content", :date="post.createDate")
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components/@/floor')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .main-post{
    box-sizing: border-box;
    background-color: #FFF;
    border-bottom: 1px dashed #E4E8EB;
    overflow: hidden;
    .title-row{
      box-sizing: border-box;
      padding: 30px 30px 0;
    }
    .title{
      font-weight: 600;
      font-size: 17px;
      color: #262626;
    }
    .label{
      flex: none;
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
    }
  }
</style>
