<template lang="jade">
   .RadioBar(:type="type")
      table
         tbody
            tr
               td(v-for="(radio, index) in radios", :key="index")
                  nuxt-link(v-if="radio.to", :to="radio.to") {{ radio.text }}
                  span(v-else) {{ radio.text }}
</template>



<script lang="coffee">

   ########################################
   #|
   #|   radio - {string} text
   #|           {*}      data
   #|           {string} [to]
   #|
   ########################################

   module.exports =
      props:
         'radios':
            type: Array
            default: []
            validator: (radios) => radios.every (radio) => radio?.text? and radio?.data?

         'type':
            type: String
            default: 'solid'
            validator: (type) => ['solid', 'ghost'].includes(type)

      methods:
         click: ->
            @$emit('click')
</script>



<style lang="less">
   .RadioBar {
      overflow: hidden;
      table {
         width: 100%;
         table-layout: fixed;
         border-collapse: collapse;
         border-radius: 2px;
         overflow: hidden;
         tr {
            td {
               padding: 0;
               border:solid 1px black;
               a, span {
                  display: block;
                  height: 34px;
                  line-height: 34px;
                  text-align: center;
                  font-size: 14px;
                  cursor: pointer;
               }
            }
         }
      }
   }

   .RadioBar[type="solid"] {
      table {
         tr {
            td {
               a, span {
                  background-color: white;
                  color: #273340;
                  background-color: #FAFBFC;
                  box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
               }
            }
         }
      }
   }
</style>