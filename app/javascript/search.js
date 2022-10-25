$(function () {
  $("#query").selectize({
    valueField: 'name',
    labelField: 'name',
    searchField: 'name',
    options: $('#query').data('options'),
  });
});
