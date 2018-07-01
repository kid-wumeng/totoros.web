<template lang="jade">
   .CommentCount(:bit="bit") {{ count }}
</template>



<script lang="coffee">
   module.exports =
      props:
         'post':
            type: Object
            required: true

      computed:
         count: -> 1 + ( @post.commentCount ? 0 )

         bit: ->
            switch
               when @count <= 9    then 1
               when @count <= 99   then 2
               when @count <= 999  then 3
               when @count <= 9999 then 4
               else                     5
</script>



<style lang="less">
   .PostItem {
      .CommentCount {
         width: 60px;
         text-align: center;
         font-family: "Adele";
         font-weight: 600;
         color: #707C88;
         text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
         user-select: none;
      }
      .CommentCount[bit="1"] { font-size: 24px }
      .CommentCount[bit="2"] { font-size: 22px }
      .CommentCount[bit="3"] { font-size: 20px }
      .CommentCount[bit="4"] { font-size: 18px }
      .CommentCount[bit="5"] { font-size: 16px }
   }
</style>