PlaceholderTextView = require './placeholder-text-view'
CSON = require('season')

module.exports =

  placeholderTextView: null

  activate: (state) ->
    path = atom.packages.getPackageDirPaths()[0]+"/placeholder-text/data/data.cson"
    result = CSON.readFileSync(path)
    console.log(atom.packages.getPackageDirPaths()[0])
    @placeholderTextView = new PlaceholderTextView(result)
    atom.workspaceView.command "placeholder-text:toggle", => @placeholderTextView.toggle()

  deactivate: ->
    @placeholderTextView.destroy()

  serialize: ->
    placeholderTextViewState: @placeholderTextView.serialize()
