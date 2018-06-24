<template lang="jade">
   #examples_Button
      Button(text="登录" type="solid")
      Button(text="登陆" type="ghost")
      Button(text="登陆" type="light")
      Button(text="Setting" type="solid")
      Button(text="Setting" type="ghost")
      Button(text="Setting" type="light")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Button': require('~/components/Button').default
</script>