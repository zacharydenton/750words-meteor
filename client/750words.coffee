wordCount = (str) ->
  words = str.match(/\S+/g)
  if words?
    words.length
  else
    0

Template.count.count = ->
  Session.get('wordcount') || 0

Template.count.finished = ->
  Session.get('wordcount') > 750

Template.editor.rendered = ->
  editor = new EpicEditor(
    parser: (text) ->
      Meteor.call 'pandoc', 'html', text, (err, res) ->
        editor.previewer.innerHTML = res
      null
    theme:
      preview: '/themes/preview/svbtle.css'
  ).load()
  editor.on 'update', ->
    Session.set 'wordcount', wordCount($(editor.getElement('editor')).text())
  Session.set 'wordcount', wordCount($(editor.getElement('editor')).text())
  window.editor = editor
