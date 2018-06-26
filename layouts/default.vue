<template lang="jade">
   nuxt
</template>



<style lang="less">

   @font-face{
      font-family: "Lato";
      src: url(~/assets/fonts/Lato-Regular.ttf);
   }

   @font-face{
      font-family: "Lato";
      src: url(~/assets/fonts/Lato-Medium.ttf);
      font-weight: 500;
   }

   @font-face{
      font-family: "Lato";
      src: url(~/assets/fonts/Lato-Semibold.ttf);
      font-weight: 600;
   }

   * {
      box-sizing: border-box;
      margin: 0;
      border: 0;
      padding: 0;
   }

   body {
      font-family: "Lato", "Helvetica Neue", "Arial", "Verdana", "Roboto", "PingFang SC", "Hiragino Sans GB", sans-serif;;
      color: #242424;
      background-image: url(~/assets/images/bg.png);
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
   }

   li {
      list-style-position: inside;
   }

   a {
      color: inherit;
      text-decoration: none;
   }
</style>