PlaceholderTextView = require './placeholder-text-view'
CSON = require('season')

module.exports =

  configDefaults:
    DataPath: atom.project.getPath()+("/data/data.cson")

  # AddQuotes: false

  placeholderTextView: null

  activate: (state) ->
    result = CSON.readFileSync(@configDefaults.DataPath)
    @placeholderTextView = new PlaceholderTextView(result)
    atom.workspaceView.command "placeholder-text:toggle", => @placeholderTextView.toggle()

  deactivate: ->
    @placeholderTextView.destroy()

  serialize: ->
    placeholderTextViewState: @placeholderTextView.serialize()
