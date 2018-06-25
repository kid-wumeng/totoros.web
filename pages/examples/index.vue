<template lang="jade">
   #examples
      Area.side
         nuxt-link(to="/examples/AlertDialog",   :class="getClass('AlertDialog')")   AlertDialog
         nuxt-link(to="/examples/Area",          :class="getClass('Area')")          Area
         nuxt-link(to="/examples/Button",        :class="getClass('Button')")        Button
         nuxt-link(to="/examples/Column",        :class="getClass('Column')")        Column
         nuxt-link(to="/examples/ConfirmDialog", :class="getClass('ConfirmDialog')") ConfirmDialog
         nuxt-link(to="/examples/Dialog",        :class="getClass('Dialog')")        Dialog
         nuxt-link(to="/examples/FilePicker",    :class="getClass('FilePicker')")    FilePicker
         nuxt-link(to="/examples/ImageCDN",      :class="getClass('ImageCDN')")      ImageCDN
         nuxt-link(to="/examples/ImageFrame",    :class="getClass('ImageFrame')")    ImageFrame
         nuxt-link(to="/examples/Input",         :class="getClass('Input')")         Input
         nuxt-link(to="/examples/Loading",       :class="getClass('Loading')")       Loading
         nuxt-link(to="/examples/Modal",         :class="getClass('Modal')")         Modal
         nuxt-link(to="/examples/PageBar",       :class="getClass('PageBar')")       PageBar
         nuxt-link(to="/examples/PromptDialog",  :class="getClass('PromptDialog')")  PromptDialog
         nuxt-link(to="/examples/Radar",         :class="getClass('Radar')")         Radar
         nuxt-link(to="/examples/RadioBar",      :class="getClass('RadioBar')")      RadioBar
         nuxt-link(to="/examples/RadioGrid",     :class="getClass('RadioGrid')")     RadioGrid
         nuxt-link(to="/examples/Rate",          :class="getClass('Rate')")          Rate
         nuxt-link(to="/examples/Row",           :class="getClass('Row')")           Row
         nuxt-link(to="/examples/SubjectDesc",   :class="getClass('SubjectDesc')")   SubjectDesc
         nuxt-link(to="/examples/SubjectFace",   :class="getClass('SubjectFace')")   SubjectFace
         nuxt-link(to="/examples/SubjectItem",   :class="getClass('SubjectItem')")   SubjectItem
         nuxt-link(to="/examples/SubjectName",   :class="getClass('SubjectName')")   SubjectName
         nuxt-link(to="/examples/SubjectRadar",  :class="getClass('SubjectRadar')")  SubjectRadar
         nuxt-link(to="/examples/TabBar",        :class="getClass('TabBar')")        TabBar
         nuxt-link(to="/examples/Table",         :class="getClass('Table')")         Table
         nuxt-link(to="/examples/TextArea",      :class="getClass('TextArea')")      TextArea
         nuxt-link(to="/examples/Tip",           :class="getClass('Tip')")           Tip
         nuxt-link(to="/examples/Toast",         :class="getClass('Toast')")         Toast
         nuxt-link(to="/examples/UserFace",      :class="getClass('UserFace')")      UserFace
      Area.main
         nuxt-child
</template>



<script lang="coffee">
   module.exports =
      components:
         'Area': require('~/components/Area').default

      methods:
         getClass: (component) ->

            isCurrentComponent = @$route.path is "/examples/#{component}"

            if isCurrentComponent
               return {'active': true}
            else
               return {}
</script>



<style lang="less">

   @padding: 16px;

   #examples {
      position: fixed;
      width: 100%;
      height: 100%;
      padding: @padding;
      display: flex;

      .Area.side {
         flex: none;
         width: 240px;
         overflow: scroll;
         padding: @padding 0;

         > a {
            display: block;
            padding: 10px 16px;
            font-size: 13px;
            color: #445669;
            &:hover {
               background-color: #F6F6F6;
            }
            &.active {
               color: white;
               background-color: #445669;
            }
         }
      }

      .Area.main {
         flex: auto;
         margin-left: @padding;
         padding: @padding;
         overflow: scroll;

         > * {
            height: 100%;
            display: flex;
            flex-direction: column;

            > * {
               flex: none;
               margin-bottom: @padding;
               &:last-child {
                  margin-bottom: 0;
               }
            }
         }
      }
   }
</style>