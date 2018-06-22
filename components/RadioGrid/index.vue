<template lang="jade">
   .RadioGrid(:type="type", :class="radioGridClass")
      table
         tbody
            tr(v-for="(radios, i) in trs", :key="i")
               td(v-for="(radio, i) in radios", :key="i", :class="getTdClass(radio)")
                  nuxt-link(v-if="radio.to", :to="radio.to") {{ radio.text }}
                  span(v-else @click="click(radio)") {{ radio.text }}
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


      model:
         prop:  'data'
         event: 'change'


      props:
         'radios':
            type: Array
            default: []
            validator: (radios) => radios.every (radio) => radio?.text? and radio?.data?

         'data':
            # 切记，当 @many = true 时，@data 应该是个数组
            type: null
            required: true

         'many':
            type: Boolean
            default: false

         'type':
            type: String
            default: 'solid'
            validator: (type) => ['solid', 'ghost'].includes(type)

         'cols':
            type: Number
            default: Number.MAX_VALUE
            validator: (cols) => cols > 0

         'auto':
            type: Boolean
            default: false


      computed:
         'trs': ->

            # 假设有 8 个 radio，@cols = 3，即是每行 3 个 radio，则：
            # [1, 2, 3, 4, 5, 6, 7, 8] => [[1, 2, 3], [4, 5, 6], [7, 8]]

            rows = Math.ceil(@radios.length / @cols)
            trs  = []

            for row in [0...rows]

                start = row * @cols
                end = start + @cols

                radios = @radios[start...end]
                trs.push(radios)

            return trs


         'isFloatRows': ->

            # 是不是浮点行 ( 不能得到整除的行数 )
            # 例如有 8 个 radio
            #
            #     若每行 3 个，8 / 3 = 浮点行
            #     若每行 2 个，8 / 2 = 整数行
            #
            # 这条数据的意义在于设置 .-is-float-rows 类，
            # 帮助 CSS 判断是否需要给最后一个 radio 添加 border-right

            rows = @radios.length / @cols

            if rows < 1
               return false
            else
               return rows < Math.ceil(rows)


         'radioGridClass': ->
            '-auto':          @auto
            '-is-float-rows': @isFloatRows


      methods:
         getTdClass: (radio) ->
            if @many
               return {'-active': @data.includes(radio.data)}
            else
               return {'-active': @data is radio.data}


         click: (radio) ->
            if @many
               @clickMany(radio)
            else
               @clickOne(radio)


         clickOne: (radio) ->
            if @data is radio.data
               @$emit('change', undefined)
            else
               @$emit('change', radio.data)


         clickMany: (radio) ->
            if @data.includes(radio.data)
               @$emit('change', @data.filter (item) => item isnt radio.data)
            else
               @$emit('change', @addRadio(radio))


         addRadio: (radio) ->

            # 向 @data 中添加一个 radio.data
            # 之所以要单独写这个方法，是为了添加后，@data 依然能保持与 @radios 一致的元素顺序

            values = [@data..., radio.data]
            radios = @radios.filter (radio) => values.includes(radio.data)
            values = radios.map (radio) => radio.data

            return data = values
</script>



<style lang="less">

   @ghost-color: #14BEB4;

   @solid-border: 1px solid rgb(209, 213, 218);
   @ghost-border: 1px solid @ghost-color;

   .RadioGrid {
      overflow: hidden;

      table {
         width: 100%;
         table-layout: fixed;
         border-collapse: collapse;

         tr {
            td {
               padding: 0;
               a, span {
                  display: block;
                  height: 32px;
                  line-height: 32px;
                  text-align: center;
                  font-weight: 500;
                  font-size: 14px;
                  cursor: pointer;
                  user-select: none;
               }
            }
         }
      }
   }


   .RadioGrid.-auto {
      table {
         table-layout: auto;
      }
   }


   .RadioGrid[type="solid"] {
      border: @solid-border;
      border-radius: 2px;

      table {
         tr {
            td {
               border: @solid-border;
               a, span {
                  color: #A2AEBA;
                  background-color: white;
               }
            }
            td.-active {
               a, span {
                  color: #445669;
                  background-color: #FAFBFC;
                  box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
               }
            }
         }
      }

      &.-is-float-rows {
         tr:last-child {
            td:last-child { border-right: @solid-border }
         }
      }
   }


   .RadioGrid[type="ghost"] {
      border: @ghost-border;
      border-radius: 3px;

      table {
         tr {
            td {
               border: @ghost-border;
               a, span {
                  color: @ghost-color;
                  background-color: transparent;
               }
            }
            td.-active {
               a, span {
                  color: white;
                  background-color: @ghost-color;
               }
            }
         }
      }

      &.-is-float-rows {
         tr:last-child {
            td:last-child { border-right: @ghost-border }
         }
      }
   }


   .RadioGrid {
      table {
         tr {
            td:first-child { border-left:  none }
            td:last-child  { border-right: none }
         }
         tr:first-child {
            td { border-top: none }
         }
         tr:last-child {
            td { border-bottom: none }
         }
      }
   }
</style>