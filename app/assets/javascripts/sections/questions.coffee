class Questions extends $SC
  opts: {}

  constructor: (@options) ->
    @options = $.extend({}, this.opts, @options)

    $(document).ready =>
      @initQuestionsForm() if $('#questions_form').length

    this
    
  initQuestionsForm: () =>
    $('#questions').delegate '#next_button', 'click', (e)->
      Analytical.event('clicked next questions')
      e.preventDefault()
      e.stopPropagation()
      $.get("/questions/get_more_questions", (response) ->
        $('#questions').html(response)
      )

    $('#questions').delegate '#vote_button', 'click', (e)->
      checkedBoxes = $("input:radio:checked").length

      if checkedBoxes < 3
        alert "Please make sure you choose only one person to Bang, Marry, and Kill."
        return false

      Analytical.event('clicked vote')
      e.preventDefault()
      e.stopPropagation()

      # Generate the data that will be sent to server
      data = {}
      $('#questions_form').find(':input').filter(':checked').each ->
        input       = $(this)
        qid         = input.attr("name")
        smk         = input.val()
        data[qid] = smk

        answered_el = $(".#{qid}.#{smk}")
        # Increment previous count by 1
        new_count   = parseInt(answered_el.html().trim()) + 1
        answered_el.html(new_count)

      $.post("/questions/respond", data, (response) ->
        if response == "success"
          $('.question_results').fadeIn()
          $('#vote_button').fadeOut();

          setTimeout (=>
            $('#next_button').fadeIn();
          ), 1000
      )

# Assign this class to the $SC.Application Namespace
$SC.Application = $.extend({}, $SC.Application, {Questions})

