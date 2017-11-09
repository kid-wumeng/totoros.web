<template lang="jade">
  file-select(multiple @select="select")
    action.action-picture
      .icon.fa-picture-o
      .label 本地图片
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select': require('components/@/file-select')
      'action':      require('./action')

    methods:
      select: (files) ->
        @dispatch('input-content/add-pictures', files)
</script>