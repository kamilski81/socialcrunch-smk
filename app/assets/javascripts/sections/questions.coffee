class Questions extends $SC
  opts: {}

  constructor: (@options) ->
    @options = $.extend({}, this.opts, @options)

    $(document).ready =>
      @initQuestionsForm() if $('#questions_form').length

    this
    
    #code added by Nathan to select buttons when two are selected and change color of selected
    checkedRadios = 0
      $(".shagmarrykill input:radio[value=\"Shag\"]").click ->
        $("input:radio[value=\"Shag\"]").attr "disabled", true
        $(this).next("span").addClass "selected"
        $(this).siblings("input:radio").attr "disabled", "disabled"
        checkedRadios = $("input:radio:checked").length
        if checkedRadios is 2
          $("input:radio").not(":disabled").next("span").addClass "selected"
          $("input:radio").not(":disabled").attr("checked", true).attr "disabled", true

      $(".shagmarrykill input:radio[value=\"Marry\"]").click ->
        numberOfCheckedRadio = $("input:radio:checked").length
        $("input:radio[value=\"Marry\"]").attr "disabled", true
        $(this).next("span").addClass "selected"
        $(this).siblings("input:radio").attr "disabled", "disabled"
        checkedRadios = $("input:radio:checked").length
        if checkedRadios is 2
          $("input:radio").not(":disabled").next("span").addClass "selected"
          $("input:radio").not(":disabled").attr("checked", true).attr "disabled", true

      $(".shagmarrykill input:radio[value=\"Kill\"]").click ->
        numberOfCheckedRadio = $("input:radio:checked").length
        $("input:radio[value=\"Kill\"]").attr "disabled", true
        $(this).next("span").addClass "selected"
        $(this).siblings("input:radio").attr "disabled", "disabled"
        checkedRadios = $("input:radio:checked").length
        if checkedRadios is 2
          $("input:radio").not(":disabled").next("span").addClass "selected"
          $("input:radio").not(":disabled").attr("checked", true).attr "disabled", true

  initQuestionsForm: () =>

    $('#questions').delegate '#next_button', 'click', (e)->
      e.preventDefault()
      e.stopPropagation()
      $.get("/questions/get_more_questions", (response) ->
        $('#questions').html(response)
      )

    $('#questions').delegate '#vote_button', 'click', (e)->
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
          ), 1500
      )

# Assign this class to the $SC.Application Namespace
$SC.Application = $.extend({}, $SC.Application, {Questions})

