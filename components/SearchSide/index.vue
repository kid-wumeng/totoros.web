<template lang="jade">
   .SearchSide
      Like(:like="like" @change="changeLike")
      ViewMode(:view="view" @change="changeView")
      Types(:types="types" @change="changeTypes")
      Styles(:styles="styles" @change="changeStyles")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Like':     require('./Like').default
         'ViewMode': require('./ViewMode').default
         'Types':    require('./Types').default
         'Styles':   require('./Styles').default

      props:
         'query':
            type: Object
            default: -> {}

      computed:
         like:   -> @query.like   ? ''
         view:   -> @query.view   ? 'list'
         types:  -> @query.types  ? []
         styles: -> @query.styles ? []

      methods:
         changeLike:   ( like )   -> @change({ like })
         changeView:   ( view )   -> @change({ view })
         changeTypes:  ( types )  -> @change({ types })
         changeStyles: ( styles ) -> @change({ styles })

         change: ( query ) ->
            query = Object.assign({}, @query, query)
            @$emit('change', query)
</script>



<style lang="less">
   .SearchSide {
      > * {
         margin-bottom: 12px;
         &:last-child {
            margin-bottom: 0;
         }
      }
   }
</style>