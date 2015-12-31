class View
  constructor: ->
    @context = {}

  build: (template, container) ->
    html = FS.templates[template] @context
    $(container).html html
