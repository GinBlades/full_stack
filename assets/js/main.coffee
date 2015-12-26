$.get '/templates.html', (data) ->
  elements = $("<div>")
  elements.html(data)
  source = elements.find("#entry-template").html()
  template = Handlebars.compile(source)
  context =
    title: "Welcome"
    body: "To the show."
  html = template(context)
  $("body").prepend(html)
