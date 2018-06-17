<template lang="jade">
   #examples_FilePicker
      FilePicker(type="userFace"    @change="changeUserFace"    @error="error"): Button(text="选择用户头像")
      FilePicker(type="subjectFace" @change="changeSubjectFace" @error="error"): Button(text="选择作品封面")
      FilePicker(type="image"       @change="changeImage"       @error="error"): Button(text="选择图片")
</template>



<script lang="coffee">
   module.exports =
      components:
         'FilePicker': require('~/components/FilePicker').default
         'Button':     require('~/components/Button').default

      methods:
         changeUserFace:    (file)  -> console.log file
         changeSubjectFace: (file)  -> console.log file
         changeImage:       (files) -> console.log files
         error:             (error) -> console.log error
</script>