<template lang="jade">
   component.MarkItem(:is="mode", :mark="mark" @update="update" @remove="remove")
</template>



<script lang="coffee">
   module.exports =

      components:
         'user':    require('./index.user').default
         'subject': require('./index.subject').default

      props:
         'mark':
            type: Object
            required: true

         'mode':
            type: String
            required: true
            validator: (mode) => ['user', 'subject'].includes(mode)

      methods:
         update: -> @$emit('update')
         remove: -> @$emit('remove')
</script>