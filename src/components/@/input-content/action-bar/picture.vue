<template lang="jade">
  file-select(multiple @select="select")
    .picture
      .icon.fa-file-picture-o
      .label 本地图片
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select': require('components/@/file-select')

    methods:
      select: (files) ->
        @dispatch('input-content/add-pictures', files)
</script>


<style lang="less" scoped>
  .picture{
    display: flex;
    align-items: center;
    cursor: pointer;
    .label{
      margin-left: 4px;
      font-size: 15px;
      font-weight: 600;
      color: #707C88;
    }
    .icon{
      margin-left: 4px;
      font-size: 16px;
      font-weight: 600;
      color: #707C88;
    }
  }
</style>