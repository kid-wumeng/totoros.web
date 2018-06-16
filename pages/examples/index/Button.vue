<template lang="jade">
   #examples_Button
      Button(text="注册")
      Button(text="登陆")
      Button(text="修改帖子")
      Button(text="Setting")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Button': require('~/components/Button').default
</script>