<template lang="jade">
  .qa
    .wrap
      .desc 这里有30道单选题，你需要答对其中任意12题
      .question(v-for="(question, qIndex) in questions", :key="qIndex")
        .title {{ qIndex + 1 }}. {{ question.title }}
        row.options
          .option(v-for="(option, oIndex) in question.options", :key="oIndex", :class="{'-active': isActive(qIndex, oIndex)}" @click="select(qIndex, oIndex)") {{ option }}
      c-button(@click="submit") 提交、正式开始注册
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')
      'c-button':  require('components/@/button')

    data: ->
      answers: []
      questions: [{
        title: '哪个巨人没在《进击的巨人》中出现过？'
        options: ['钢铁巨人', '车巨人', '颚巨人', '战锤巨人']
        right: 0
      },{
        title: '哪部作品是以古希腊文明为背景？'
        options: ['《魔笛MAGI》', '《少女新娘物语》', '《历史之眼》', '《天是红河岸》']
        right: 2
      },{
        title: '哪个团体不属于《剑风传奇》？'
        options: ['鹰之团', '守夜人', '米特兰王国', '神之手']
        right: 1
      },{
        title: '浦泽直树的作品中，哪位主角的职业是漫画家？'
        options: ['平贺·奇顿·太一', '天马贤三', '远藤贤知', '凯文·山县']
        right: 3
      },{
        title: '《东京喰种》中，笛口雏实拥有哪两种赫子？'
        options: ['甲赫与鳞赫', '鳞赫与羽赫', '羽赫与尾赫', '尾赫与甲赫']
        right: 0
      },{
        title: '《JOJO奇妙冒险》中，布奇神父的替身「天堂制造」的能力是？'
        options: ['时间暂停', '时间倒流', '时间消除', '时间加速']
        right: 3
      },{
        title: '哪部武士漫画中没有出现过火器？'
        options: ['《浪客剑心》', '《无限之住人》', '《浪客行》', '《死狂（剑豪生死斗）》']
        right: 2
      },{
        title: '哪位漫画家没有画过以“青春与成长”为题的长篇作品？'
        options: ['押见修造', '甲斐谷忍', '浅野一二〇', '松本大洋']
        right: 1
      },{
        title: '《周刊青年JUMP》的三原则是？'
        options: ['友情、努力、胜利', '爱、暴力、权力', '友情、胜利、责任', '爱、努力、责任']
        right: 1
      },{
        title: '哪部动画电影曾入围戛纳国际电影节的主竞赛单元？'
        options: ['《千与千寻》', '《悲伤的贝拉多娜》', '《攻壳机动队2：无罪》', '《在这世界的角落》']
        right: 2
      },{
        title: '《全职猎人》贪婪之岛篇中能够治愈玩家伤痛的卡片是？'
        options: ['一坪的海岸线', '魔女的返老还童药', '统治者的祝福', '大天使的吐息']
        right: 3
      },{
        title: '与《名侦探柯南》、《金田一少年之事件簿》并称“日本三大推理漫画”的作品是？'
        options: ['《Q.E.D. 证明终了》', '《死亡笔记》', '《冰菓》', '《魍魉之匣》']
        right: 0
      },{
        title: '哪一组漫画家与他擅长描绘的运动题材不相符？'
        options: ['安达充与棒球', '高桥阳一与足球', '井上雄彦与篮球', '重野秀一与赛马']
        right: 3
      },{
        title: '《新世纪福音战士》背景相关的《死海古卷》是什么教派的文书？'
        options: ['天主教', '犹太教', '东正教', '伊斯兰教']
        right: 1
      },{
        title: '《周刊少年JUMP》史上连载话数最多的恋爱题材作品是？'
        options: ['《伪恋》', '《草莓100%》', '《I"s》', '《To LOVE（出包王女）》']
        right: 0
      },{
        title: '谁不是《火凤燎原》里军师培养学院「水镜府」的门生？'
        options: ['杨修', '赵云', '司马懿', '华佗']
        right: 2
      },{
        title: '招式「爆芯」出自哪部格斗题材漫画？'
        options: ['《北斗神拳》', '《刃牙》', '《拳愿阿修罗》', '《军鸡》']
        right: 2
      },{
        title: '新海诚的哪部作品，配乐不是由天门制作？'
        options: ['《秒速5厘米》', '《你的名字。》', '《她与她的猫》', '《追逐繁星的孩子》']
        right: 1
      },{
        title: '《机动战士高达》系列作品中，哪个装置不是基于米诺夫斯基物理学？'
        options: ['光之翼', 'M-弹头', '光束军刀', '热能斧']
        right: 3
      },{
        title: '尾田荣一郎是受了哪部作品的影响，才致力于创作海贼的故事？'
        options: ['《北海小英雄》', '《大航海时代》', '《加勒比海盗》', '《海盗电台》']
        right: 0
      },{
        title: '描绘广岛核爆之后的作品是？'
        options: ['《国家燃烧》', '《核爆默示录》', '《夕凪之街樱之国》', '《人间失格》']
        right: 2
      },{
        title: '哪一部生存游戏题材的漫画中，失败者不会死亡？'
        options: ['《诚如神之所说》', '《弥留之国的爱丽丝》', '《杀戮都市》', '《欺诈游戏》']
        right: 3
      },{
        title: '《孤独的美食家》作者是？'
        options: ['古屋兔丸', '谷口治郎', '高桥努', '古谷实']
        right: 1
      },{
        title: '哪一部末世题材作品，怪物不是由人类变成的？'
        options: ['《漂流教室》', '《彼岸岛》', '《请叫我英雄》', '《感染》']
        right: 0
      },{
        title: '《钢之炼金术师》的主旨是？'
        options: ['人类的赞歌', '反抗命运', '战争、和平、革命', '等价交换']
        right: 3
      },{
        title: '哪部科幻题材作品不是由小说改编的？'
        options: ['《战斗妖精雪风》', '《BLAME!》', '《穿越时空的少女》', '《苍穹之法芙娜》']
        right: 1
      },{
        title: '描绘攀岩的作品是？'
        options: ['《地雷阵》', '《阿基拉》', '《孤高之人》', '《黑礁》']
        right: 2
      },{
        title: '哪部包含性描写的作品，男主角活到了结局？'
        options: ['《枪王黑泽》', '《霸王爱人》', '《浮恋》', '《外天楼》']
        right: 0
      },{
        title: '哪个不是华语漫画圈知名的贡献团体？'
        options: ['阳光下的咪西', 'totoros', '小良家族', '王样汉化组']
        right: 1
      },{
        title: '哪位动画导演习惯以坚强的少女作为主人公？'
        options: ['宫崎骏', '今敏', '汤浅政明', '大友克洋']
        right: 0
      }]

    methods:
      select: (qIndex, oIndex) ->
        if(@answers[qIndex] is oIndex)
          @$set(@answers, qIndex, null)
        else
          @$set(@answers, qIndex, oIndex)

      isActive: (qIndex, oIndex) ->
        return @answers[qIndex] is oIndex

      submit: ->
        rightCount = 0
        for question, i in @questions
          if(@answers[i] is question.right)
            rightCount++
        if(rightCount >= 12)
          @notify('done', "你答对了 #{rightCount} 道题，请一定加入我们 ~")
          @$emit('qa-pass', rightCount)
        else
          @notify('fail', "你只答对了 #{rightCount} 道题，请再看看")
</script>


<style lang="less" scoped>
  .qa{
    .wrap{
      margin: 30px auto;
      width: 600px;
      overflow: hidden;
      .desc{
        font-weight: 600;
        font-size: 20px;
        color: #A2AEBA;
        margin: 30px 0;
      }
      .question{
        padding: 20px 0;
        border-bottom: 1px dashed #EEE;
        .title{
          font-weight: 600;
          color: #707C88;
        }
        .options{
          margin-top: 12px;
          margin-left: 2em;
          box-sizing: border-box;
          .option{
            font-weight: 600;
            color: #A2AEBA;
            cursor: pointer;
            user-select: none;
            margin-right: 24px;
            &:last-child{
              margin-right: 0;
            }
          }
          .option.-active{
            font-weight: 600;
            color: #3db8c1;
          }
        }
      }
    }
    .button{
      margin-top: 20px;
    }
  }
</style>