<template lang="jade">
   Input.Content(:text="content" area hint="评论 / 可选" @input="input")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Input': require('~/components/Input').default

      model:
         prop:  'content'
         event: 'input'

      props:
         'content':
            type: String
            required: true

      methods:
         input: (text) -> @$emit('input', text)
</script>



<style lang="less">
   .Content {
      width: 100%;
      height: 174px;
   }
</style>