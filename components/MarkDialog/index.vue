<template lang="jade">
   Dialog.MarkDialog(:open="open" @close="close")
      button(slot="action" @click="close") 取消
      button(slot="action" @click="sure")  确定
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'TextArea': require('~/components/TextArea').default

      props:
         'open':
            type: Boolean
            default: false
         'mark':
            type: Object
            default: null

      computed:
         id:      -> mark?.id
         step:    -> mark?.step    ? 1
         score:   -> mark?.score   ? 0
         world:   -> mark?.world   ? false
         story:   -> mark?.story   ? false
         roles:   -> mark?.roles   ? false
         paint:   -> mark?.paint   ? false
         music:   -> mark?.music   ? false
         content: -> mark?.content ? ''

      methods:
         sure: ->
            @$emit('sure')

         close: ->
            @$emit('close')
</script>



<style lang="less">
   .MarkDialog {
   }
</style>