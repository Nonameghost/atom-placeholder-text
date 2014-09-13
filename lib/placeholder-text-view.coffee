{SelectListView} = require 'atom'

module.exports =
class PlaceholderTextView extends SelectListView
  #  @content: ->
  #    @div class: 'overlay from-top select-list'

  editor: null
  selection: null

  initialize: (@listOfItems) ->
    super
    @addClass('overlay from-top select-list')
    @setItems(@listOfItems)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  attach: ->
    atom.workspaceView.append(this)
    @focusFilterEditor()

  # Tear down any state and detach
  destroy: ->
    @detach()

  # Here you specify the view for an item

  viewForItem: (item) ->
      "
      <li class=\"two-lines\">
        <div class=\"primary-line\">#{item.name}</div>
        <div class=\"secondary-line\">#{item.text.substring(0,100)}</div>
      </li>
      "

  confirmed: (item) ->
    # console.log(item)
    @selection.insertText(item.text)


  cancel: ->
      @toggle()

  toggle: ->
    # console.log "PlaceholderTextView was toggled!"
    if @hasParent()
      @detach()
    else
      @editor = atom.workspace.activePaneItem
      @selection = @editor.getSelection()
      atom.workspaceView.append(this)
      @focusFilterEditor()
