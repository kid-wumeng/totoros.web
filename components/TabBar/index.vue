<template lang="jade">
   .TabBar(:class="tabBarClass")
      table
         tbody
            tr
               td(v-for="(tab, i) in tabs", :key="i", :class="getTdClass(tab)")
                  nuxt-link(v-if="tab.to", :to="tab.to") {{ tab.text }}
                  span(v-else @click="click(tab)") {{ tab.text }}
</template>



<script lang="coffee">

   ########################################
   #|
   #|   tab - {string} text
   #|         {*}      data
   #|         {string} [to]
   #|
   ########################################

   module.exports =


      model:
         prop:  'data'
         event: 'change'


      props:
         'tabs':
            type: Array
            default: []
            validator: (tabs) => tabs.every (tab) => tab?.text? and tab?.data?

         'data':
            type: null
            required: true

         'auto':
            type: Boolean
            default: false


      computed:
         tabBarClass: ->
            '-auto': @auto


      methods:
         getTdClass: (tab) ->
            if @data is tab.data
               return {'-active': true}
            else
               return {}


         click: (tab) ->
            if @data isnt tab.data
               @$emit('change', tab.data)
</script>



<style lang="less">
   .TabBar {
      table {
         width: 100%;
         table-layout: fixed;
         border-collapse: collapse;

         tr {
            td {
               padding: 0;
               a, span {
                  display: block;
                  height: 42px;
                  line-height: 42px;
                  text-align: center;
                  font-weight: 500;
                  font-size: 14px;
                  color: #CDD6E0;
                  border-bottom: 1px solid rgba(245, 245, 245, 1);
                  cursor: pointer;
                  user-select: none;
                  transition: all 0.2s ease;
               }
            }

            td.-active {
               a, span {
                  color: #14BEB4;
                  border-bottom-color: #14BEB4;
                  cursor: default;
               }
            }
         }
      }
   }

   .TabBar.-auto {
      table {
         table-layout: auto;
      }
   }
</style>