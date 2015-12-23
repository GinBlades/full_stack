requirejs.config
  baseUrl: "/js"
  paths:
    jquery: "/jquery/dist/jquery.min"
    bootstrap: "/bootstrap-sass/assets/javascripts/bootstrap.min"

requirejs ['jquery'], ($) ->
  requirejs ['bootstrap'], (bs) ->
    requirejs ['another'], (a) ->
      $("h1").css("color", "blue")
      a.test()
      console.log "Required"
