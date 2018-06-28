<template lang="jade">
   nuxt-link.UserName(v-if="clickable", :size="size", :to="to") {{ user.name }}
   span.UserName(v-else :size="size") {{ user.name }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'user':
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
            return "/users/#{@user.id}"
</script>



<style lang="less">
   .UserName {
      display: block;
      text-align: justify;
      word-break: break-all;
      font-family: "Ubuntu";
      color: #273340;
   }

   .UserName[size="small"] {
      font-size: 13px;
   }

   .UserName[size="medium"] {
      font-weight: 500;
      font-size: 15px;
   }

   .UserName[size="large"] {
      font-size: 16px;
   }

   a.UserName {
      &:hover {
         text-decoration: underline;
      }
   }
</style>