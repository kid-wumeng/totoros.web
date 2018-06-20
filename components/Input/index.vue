<template lang="jade">
   textarea.Input(
      v-if="area",
      :value="text",
      :type="nativeType",
      :placeholder="hint",
      :autofocus="autofocus",
      :disabled="disabled",
      spellcheck="false",
      @input="input"
      @focus="focus"
      @blur="blur"
   )

   input.Input(
      v-else,
      :value="text",
      :type="nativeType",
      :placeholder="hint",
      :autofocus="autofocus",
      :disabled="disabled",
      spellcheck="false",
      @input="input"
      @focus="focus"
      @blur="blur"
   )
</template>



<script lang="coffee">
   module.exports =
      model:
         prop: 'text'

      props:
         'area':
            type: Boolean
            default: false

         'text':
            type: String
            default: ''

         'type':
            type: String
            default: 'text'
            validator: (type) => ['text', 'pass', 'number'].includes(type)

         'hint':
            type: String
            default: ''

         'autofocus':
           type: Boolean
           default: false

         'disabled':
           type: Boolean
           default: false

      computed:
         'nativeType': ->
            switch @type
               when 'text'   then 'text'
               when 'pass'   then 'password'
               when 'number' then 'number'

      methods:
         input: (event) ->
            @$emit('input', text = event.target.value.trim())

         focus: (event) ->
            @$emit('focus')

         blur:  (event) ->
            @$emit('blur')
</script>



<style lang="less">

   @line-height-textarea: 26px;
   @line-height-input:    34px;

   .Input {
      display: block;
      padding: 0 10px;
      font-size: 14px;
      color: #273340;
      background-color: #FAFBFC;
      border: 1px solid rgb(209, 213, 218);
      border-radius: 2px;
      box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);

      &::placeholder {
         color: #BBB;
      }

      &[disabled] {
         color: #BBB;
         background-color: transparent;
         border: 1px solid #F2F2F2;
         box-shadow: none;
      }
   }

   textarea.Input {
      padding-top:    @line-height-input / 2 - @line-height-textarea / 2;
      padding-bottom: @line-height-input / 2 - @line-height-textarea / 2;
      line-height:    @line-height-textarea;
      resize: none;
   }

   input.Input {
      height:      @line-height-input;
      line-height: @line-height-input;
   }
</style>