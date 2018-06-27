<template lang="jade">
   .UserName(:size="size" @click="click") {{ user.name }}
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

      methods:
         click: ->
            @$router.push("/users/#{@user.id}")
</script>



<style lang="less">
   .UserName {
      text-align: justify;
      color: #273340;
      word-break: break-all;
      cursor: pointer;

      &:hover {
         color: #14BEB4;
      }
   }

   .UserName[size="small"] {
      font-size: 13px;
   }

   .UserName[size="medium"] {
      font-weight: 500;
      font-size: 14px;
   }

   .UserName[size="large"] {
      font-size: 16px;
   }
</style>