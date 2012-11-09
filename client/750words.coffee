Template.count.count = ->
  Session.get('wordcount') || 0

Template.count.finished = ->
  Session.get('wordcount') > 750

Template.editor.rendered = ->
  editor = new EpicEditor(
    theme:
      preview: '/themes/preview/svbtle.css'
  ).load()
  editor.on 'update', ->
    Session.set 'wordcount', $(editor.getElement('editor')).text().split(/\s+/).length
  Session.set 'wordcount', $(editor.getElement('editor')).text().split(/\s+/).length
