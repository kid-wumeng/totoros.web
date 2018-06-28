<template lang="jade">
   #examples_TextArea
      TextArea(:text="text")
      TextArea(:text="html" html)
</template>



<script lang="coffee">
   module.exports =
      components:
         'TextArea': require('~/components/TextArea').default

      data: ->
         text: """
            头上有会动的天线来捕捉信号和匹特星人的命令，白色身体上点缀些一些黑点，甚是特别。最早被匹特星人藏在木曾谷的吾妻湖。


            口中能发射光弹，而其常用攻击手段是用标志性长长的尾巴缠住对手，然后放电攻击对手。不过在与赛文交战中虽然电击赛文，但后来其头部的天线被艾梅利光破坏， 尾巴被头镖切断而死。其名字来源于“电气之王”。艾雷王是奥特曼系列中相当受欢迎的怪兽，在泰罗第28集《怪兽艾雷王》中稍改其形象登场，而在在赛文94电视特别版第1集《 太阳能作战》中随匹特星人回到地球。此外，在麦克斯第2集《饲养怪兽的女子》和第27集《被夺走的麦克斯火花》中以吸电龙的姿态登场，梦比优斯中则以人造怪兽的姿态，以小艾雷王的可爱身份登场。
         """

         html: """
            <h1 id="post-marked-in-the-browser">Marked in the browser</h1>
            <p><user id="1">@龙猫KID</user> 头上有会动的<a href="http://www.baidu.com">天线ABC</a>来捕捉信号和匹特星人的命令，白色身体上点缀些一些黑点，甚是特别。</p>
            <blockquote>
            <p>头上有会动的<a href="http://www.baidu.com">天线ABC</a>来捕捉信号和匹特星人的命令，白色身体上点缀些一些黑点，甚是特别。</p>
            </blockquote>
            <ol>
               <li>初代奥特曼</li>
               <li><strong>赛文</strong>奥特曼</li>
               <li><em>杰克</em>奥特曼</li>
               <li>艾斯奥特曼</li>
            </ol>

            <subject id="1" face-ver="5">
               <name>剑风传奇</name>
               <type>comic</type>
               <start>
                  <year>1999</year>
                  <month>6</month>
                  <day>15</day>
               </start>
               <authors>
                  <author>三浦建太郎</author>
                  <author>樱庭一树</author>
               </authors>
               <styles>
                  <style>魔幻</style>
                  <style>战争</style>
               </styles>
               <score>9.6</score>
            </subject>

            <subject id="2.5">
               <name>名侦探柯南</name>
               <score>9.6</score>
            </subject>

            <p>Rendered by <strong>marked</strong>.</p>

            <subject id="2">
               <name>名侦探柯南</name>
               <score>9.6</score>
            </subject>
         """
</script>



<style lang="less">
   #examples_TextArea {
      > .TextArea {
         width: 700px;
         text-indent: 2em;
      }
   }
</style>