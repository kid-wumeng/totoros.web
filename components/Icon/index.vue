<template lang="jade">
   .Icon(:name="name")
</template>



<script lang="coffee">
   module.exports =
      props:
         'name':
            type: String
            required: true
            validator: (name) => ['bell'].includes(name)
</script>



<style lang="less">
   @font-face {
      font-family: "icon";
      src: url(~/assets/fonts/icon.ttf);
   }

   .Icon {
     font-family: 'icon';
   }

   .Icon[name="bell"]:before { content: "\e900" }
</style>