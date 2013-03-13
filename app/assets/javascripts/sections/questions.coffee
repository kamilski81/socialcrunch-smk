class Questions extends $SC
  opts: {}

  constructor: (@options) ->
    @options = $.extend({}, this.opts, @options)

    $(document).ready =>
      @initQuestionsForm() if $('#questions_form').length

    this

  initQuestionsForm: () =>

    $('#questions').delegate '#questions_submit', 'click', (e)->
      e.preventDefault()
      e.stopPropagation()
      data = {}
      $('#questions_form').find(':input').filter(':checked').each ->
        input       = $(this)
        input_name  = input.attr("name")
        input_val   = input.val()
        data[input_name] = input_val

      $.post("/questions/respond", data, (response) ->
        $('#questions').html(response)
      )

      false

    false

# Assign this class to the $SC.Application Namespace
$SC.Application = $.extend({}, $SC.Application, {Questions})

