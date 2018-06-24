module.exports = formatSubjectGroups = ( textArea ) ->

   ########################################
   #|
   #|   @params {HTMLElement} textArea
   #|
   #|   例如 textArea 的 DOM 结构如下：
   #|
   #|      <subject id="1">...</subject>
   #|      <subject id="2">...</subject>
   #|      <p></p>
   #|      <subject id="2">...</subject>
   #|
   #|   本函数执行后，DOM 结构变为：
   #|
   #|      <subject-group>
   #|         <subject id="1">...</subject>
   #|         <subject id="2">...</subject>
   #|      </subject-group>
   #|      <p></p>
   #|      <subject-group>
   #|         <subject id="2">...</subject>
   #|      </subject-group>
   #|
   ########################################

   els    = selectChilds(textArea)
   groups = divideGroups(els)
   groups = createGroups(groups)





selectChilds = ( textArea ) ->

   ########################################
   #|
   #|   选取 textArea 中所有的子元素
   #|
   #|   @params {HTMLElement}   textArea
   #|   @return {HTMLElement[]} els
   #|
   ########################################

   nodes = textArea.childNodes
   els   = []

   for node in nodes
      if node.nodeType is 1
          els.push(node)

   return els





divideGroups = ( els ) ->

   ########################################
   #|
   #|   分配 <subject> 到合适的分组中
   #|
   #|   @params {HTMLElement[]}   els
   #|   @return {HTMLElement[][]} groups
   #|
   ########################################

   groups = []
   group  = []

   for el, i in els

      next = els[i+1]

      if isSubject(el)
         group.push(el)

         if !isSubject(next)
            groups.push(group)
            group = []

   return groups





isSubject = ( el ) ->

   ########################################
   #|
   #|   是否为 <subject>
   #|
   #|   @params {HTMLElement} el
   #|   @return {boolean}
   #|
   ########################################

   return el and el.nodeName is 'SUBJECT'





createGroups = ( groups ) ->

   ########################################
   #|
   #|   @params {HTMLElement[][]} groups
   #|   @return {HTMLElement[]}   groups
   #|
   ########################################

   for subjects in groups

       group = createGroup(subjects)

       replace(subjects[0], group)

       subjects.slice(1).forEach(remove)





createGroup = ( subjects ) ->

   ########################################
   #|
   #|   @params {HTMLElement[]} subjects
   #|   @return {HTMLElement}   group
   #|
   ########################################

   group    = create('subject-group')
   subjects = createSubjects(subjects)

   for subject in subjects
       group.appendChild(subject)

   return group





createSubjects = ( subjects ) ->

   ########################################
   #|
   #|   @params {HTMLElement[]} subjects
   #|   @return {HTMLElement[]} subjects
   #|
   ########################################

   return subjects.map(createSubject)





createSubject = ( subject ) ->

   ########################################
   #|
   #|   @params {HTMLElement} subject
   #|   @return {HTMLElement} subject
   #|
   ########################################

   id      = subject.id
   faceVer = subject.getAttribute('face-ver')
   name    = subject.querySelector('subject > name')
   start   = subject.querySelector('subject > start')
   type    = subject.querySelector('subject > type')
   authors = subject.querySelector('subject > authors')
   styles  = subject.querySelector('subject > styles')

   subject = create('subject')
   subject.id = id

   subject.appendChild(createFace(id, faceVer))
   subject.appendChild(createName(name))
   subject.appendChild(createDesc(start, type, authors, styles))

   bindEvent(subject)

   return subject





createFace = ( id, faceVer ) ->

   ########################################
   #|
   #|   @params {string}      id
   #|   @params {string}      faceVer
   #|   @return {HTMLElement} face
   #|
   ########################################

   face = create('face')

   if io.isID(id) and faceVer

      url = io.cdn("subjects/#{id}/face?ver=#{faceVer}")

      face.style.backgroundImage = "url(#{url})"

   return face





createName = ( name ) ->

   ########################################
   #|
   #|   @params {HTMLElement} name
   #|   @return {HTMLElement} name
   #|
   ########################################

   if name
      return create('name', name.innerText)
   else
      return create('name', '???')





createDesc = ( start, type, authors, styles ) ->

   ########################################
   #|
   #|   @params {HTMLElement} start
   #|   @params {HTMLElement} type
   #|   @params {HTMLElement} authors
   #|   @params {HTMLElement} styles
   #|
   #|   @return {HTMLElement} desc
   #|
   ########################################

   descs = []

   if start   then descs.push(getStartText(start))
   if type    then descs.push(getTypeText(type))
   if authors then descs.push(getAuthorsText(authors))
   if styles  then descs.push(getStylesText(styles))

   return create('desc', descs.join(' / '))





getStartText = ( start ) ->

   ########################################
   #|
   #|   @params {HTMLElement} start
   #|   @return {string}      startText
   #|
   ########################################

   if start

      year  = start.querySelector('start > year')?.innerText
      month = start.querySelector('start > month')?.innerText
      day   = start.querySelector('start > day')?.innerText

      start = [ year, month, day ].filter (item) => item

      return start.join('-')

   else
      return ''





getTypeText = ( type ) ->

   ########################################
   #|
   #|   @params {HTMLElement} type
   #|   @return {string}      typeText
   #|
   ########################################

   return io.formatSubjectType(type.innerText)





getAuthorsText = ( authors ) ->

   ########################################
   #|
   #|   @params {HTMLElement} authors
   #|   @return {string}      authorsText
   #|
   ########################################

   authors = authors.querySelectorAll('authors > author')
   authors = array(authors)
   authors = authors.map (author) => author.innerText
   authors = authors.filter (author) => author

   return authors.join('、')





getStylesText = ( styles ) ->

   ########################################
   #|
   #|   @params {HTMLElement} styles
   #|   @return {string}      stylesText
   #|
   ########################################

   styles = styles.querySelectorAll('styles > style')
   styles = array(styles)
   styles = styles.map (style) => style.innerText
   styles = styles.filter (style) => style

   return styles.join('、')





array = ( els ) ->

   ########################################
   #|
   #|   NodeList => Node[]
   #|
   #|   @params {NodeList} els
   #|   @return {Node[]}   els
   #|
   ########################################

   return [].map.call(els, (el) => el)





create = ( tag, text = '' ) ->

   ########################################
   #|
   #|   创建元素
   #|
   #|   @params {string}      tag
   #|   @params {string}     [text]
   #|
   #|   @return {HTMLElement} el
   #|
   ########################################

   el = document.createElement(tag)
   el.innerText = text.trim()

   return el





replace = ( oldEl, newEl ) ->

   ########################################
   #|
   #|   替换元素
   #|
   #|   @params {HTMLElement} oldEl
   #|   @params {HTMLElement} newEl
   #|
   ########################################

   if oldEl and newEl
      oldEl.parentNode.replaceChild(newEl, oldEl)





remove = ( el ) ->

   ########################################
   #|
   #|   移除元素
   #|
   #|   @params {HTMLElement} el
   #|
   ########################################

   if el
      el.parentNode.removeChild(el)





bindEvent = ( subject ) ->

   ########################################
   #|
   #|   @params {HTMLElement} subject
   #|
   ########################################

   subject.addEventListener 'click', ->
      window.open("/subjects/#{subject.id}")