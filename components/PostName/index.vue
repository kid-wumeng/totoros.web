<template lang="jade">
   nuxt-link.PostName(v-if="clickable", :size="size", :to="to") {{ post.name }}
   span.PostName(v-else :size="size") {{ post.name }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'post':
            type: Object
            required: true

         'size':
            type: String
            default: 'medium'
            validator: (size) => ['small', 'medium', 'large'].includes(size)

         'clickable':
            type: Boolean
            default: false


      computed:
         to: ->
            return "/posts/#{@post.id}"
</script>



<style lang="less">
   .PostName {
      display: block;
      text-align: justify;
      word-break: break-all;
      font-family: "Ubuntu";
      color: #262626;
   }

   .PostName[size="small"] {
      font-size: 13px;
   }

   .PostName[size="medium"] {
      font-size: 15px;
   }

   .PostName[size="large"] {
      font-size: 16px;
   }

   a.PostName {
      &:hover {
         text-decoration: underline;
      }
   }
</style>