class Home extends $SC
  opts: {}

  constructor: (@options) ->
    this

# Assign this class to the $SC.Application Namespace
$SC.Application = $.extend({}, $SC.Application, {Home})

