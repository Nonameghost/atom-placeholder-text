{WorkspaceView} = require 'atom'
PlaceholderText = require '../lib/placeholder-text'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.
#
# describe "PlaceholderText", ->
#   activationPromise = null
#
#   beforeEach ->
#     atom.workspaceView = new WorkspaceView
#     activationPromise = atom.packages.activatePackage('placeholder-text')
#
#   describe "when the placeholder-text:toggle event is triggered", ->
#     it "attaches and then detaches the view", ->
#       expect(atom.workspaceView.find('.placeholder-text')).not.toExist()
#
#       # This is an activation event, triggering it will cause the package to be
#       # activated.
#       atom.workspaceView.trigger 'placeholder-text:toggle'
#
#       waitsForPromise ->
#         activationPromise
#
#       runs ->
#         expect(atom.workspaceView.find('.placeholder-text')).toExist()
#         atom.workspaceView.trigger 'placeholder-text:toggle'
#         expect(atom.workspaceView.find('.placeholder-text')).not.toExist()
