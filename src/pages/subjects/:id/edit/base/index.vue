<template lang="jade">
  #subjects-edit-base
    editable-input(v-model="name" label="作品名" hint="优先填写中文名")
</template>


<script lang="coffee">
  module.exports =
    components:
      'editable-input': require('components/wiki/EditableInput')

    data: ->
      name: '名侦探柯南'
</script>


<style lang="less" scoped>
  #subjects-edit-base{
    box-sizing: border-box;
    padding: 16px;
    width: 400px;
  }
</style>
