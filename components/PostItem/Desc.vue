<template lang="jade">
   .Desc(v-html="desc")
</template>



<script lang="coffee">
   module.exports =

      props:
         'post':
            type: Object
            required: true

      computed:
         date:         -> @post.createDate
         user:         -> @post.user
         lastDate:     -> @post.lastDate
         commentCount: -> @post.commentCount ? 0

         lastPage: ->
            if @commentCount
               return Math.ceil(@commentCount / 50)
            else
               return 1

         lastTo: ->
            if @lastPage > 1
               return "/posts/1?page=#{@lastPage}"
            else
               return "/posts/1"

         desc: ->
            descs = []

            if @date
               descs.push(io.formatDate(@date))

            if @user
               descs.push('<a class="user">' + @user.name + '</a>')

            if @lastDate
               descs.push('<a class="last">last at ' + io.formatDate(@lastDate, auto = true) + '</a>')

            return descs.join('<span class="sep">/</span>')


      mounted: ->
         @bindEvent()


      methods:
         bindEvent: ->
            user = @$el.querySelector('a.user')
            last = @$el.querySelector('a.last')

            if user
               user.addEventListener 'click', => @$router.push("/users/#{@user.id}")

            if last
               last.addEventListener 'click', => @$router.push(@lastTo)
</script>



<style lang="less">
   .PostItem {
      .Desc {
         font-family: "Ubuntu";
         font-size: 12px;
         color: #A2AEBA;
         user-select: none;

         .sep {
            margin: 0 8px;
            font-family: "Adele";
         }

         a {
            cursor: pointer;
            &:hover {
               color: #273340;
               text-decoration: underline;
               text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
            }
         }
      }
   }
</style>