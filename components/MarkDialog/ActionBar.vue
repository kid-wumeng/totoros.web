<template lang="jade">
   Row.ActionBar(x="between" y="center")
      Row
         Button.remove(text="移除" type="alert" @click="remove")
      Row
         Button.cancel(text="取消" type="light" @click="cancel")
         Button.ensure(text="确定" type="ghost" @click="ensure")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':    require('~/components/Row').default
         'Button': require('~/components/Button').default

      props:
         'mark':
            type: Object
            default: null

      methods:
         remove: ->
            @$emit('remove')

         cancel: ->
            @$emit('cancel')

         ensure: ->
            if @mark
               @$emit('update')
            else
               @$emit('create')
</script>



<style lang="less">
   .ActionBar {
      .Button {
         height: 32px;
         &.cancel {
            margin-right: 12px;
         }
      }
   }
</style>