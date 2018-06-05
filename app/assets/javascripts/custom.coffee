jQuery ->
$("input[data-radio-group]").on 'change', (e) ->
$("input[data-radio-group='" + $(e.target).data('radioGroup') +
"']").attr('checked', false)
$(e.target).attr('checked', true)