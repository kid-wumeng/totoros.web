<template lang="jade">
   .PageBar
      nuxt-link.prev(v-show="showPrev", :to="getTo(currentPage - 1)") Prev
      nuxt-link.page(v-show="showOnePage", :to="getTo(1)") {{ 1 }}
      span.dots(v-show="showOnePage") ...
      nuxt-link.page(v-for="page in pages", :key="page", :to="getTo(page)", :class="getPageClass(page)") {{ page }}
      span.dots(v-show="showMaxPage") ...
      nuxt-link.page(v-show="showMaxPage", :to="getTo(maxPage)") {{ maxPage }}
      nuxt-link.next(v-show="showNext", :to="getTo(currentPage + 1)") Next
</template>



<script lang="coffee">
   module.exports =


      props:
         'count':
            type: Number
            default: 0
            validator: (count) => count >= 0

         'size':
            type: Number
            default: 1
            validator: (size)  => size >= 1


      computed:
         'currentPage': ->
            return parseInt(@$route.query.page ? 1)


         'maxPage': ->
            return Math.ceil(@count / @size)


         'pages': ->
            pages = []
            start = parseInt((@currentPage - 1) / 10) * 10

            for i in [1..10]
               page = start + i

               if page <= @maxPage
                  pages.push(page)
               else
                  break

            return pages


         'showPrev': ->
            return @currentPage > 1


         'showNext': ->
            return @currentPage < @maxPage


         'showOnePage': ->
            return !@pages.includes(1)


         'showMaxPage': ->
            return !@pages.includes(@maxPage)


      methods:
         getTo: (page) ->

            path  = @$router.path
            query = @$router.query

            if page > 1
               query = Object.assign({}, query, { page })
            else
               query = Object.assign({}, query)

            return { path, query }


         getPageClass: (page) ->
            if page is @currentPage
               return {'-active': true}
            else
               return {}
</script>



<style lang="less">
   .PageBar {
      display: flex;
      align-items: center;
      user-select: none;

      > * {
         display: flex;
         justify-content: center;
         align-items: center;
         height: 40px;
         font-size: 15px;
         color: #A2AEBA;
         border-bottom: 1px solid transparent;
         transition: color 0.3s ease, border-bottom-color 0.3s ease;
      }

      .prev,
      .next,
      .dots {
         padding: 0 18px;
      }

      .page {
         width: 52px;
      }

      .prev,
      .next,
      .page:hover,
      .page.-active {
         font-weight: 500;
         color: #273340;
      }

      .prev:hover,
      .next:hover,
      .page:hover,
      .page.-active {
         border-bottom-color: #273340;
      }
   }
</style>