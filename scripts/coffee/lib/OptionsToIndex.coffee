object = require 'utila/scripts/js/lib/object'

module.exports = class OptionsToIndex

	constructor: (template) ->

		unless object.isBareObject template

			throw Error "template must only be a bare object"

		@_possibleOptions = {}

		for name, val of template

			if Array.isArray val

				@_possibleOptions[name] = val

			else

				@_possibleOptions[name] = [no, yes]

	getIndex: (options) ->

		index = 0

		cur = 1

		for name, choices of @_possibleOptions

			val = options[name]

			i = choices.indexOf(val)

			if val? and i isnt -1

				index += cur * i

			cur *= 10

		index