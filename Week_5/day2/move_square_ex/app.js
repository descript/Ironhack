
$(function () {
  var rows = 10;
  var cols = 10;
  var cells = [];
  // var even = true;
  function createGrid(root) {
    for(var i = 0; i < cols; i++) {
      for(var j = 0; j < cols; j++) {
        var cell = $('<div>').addClass('cell');
        cell.attr('data-row', i).attr('data-col', j);
        cells.push(cell);
        root.append(cell);
      }
    }
  };

  var $root = $('.container');
  createGrid($root);

  $('.cell').click(function(event) {
    console.log(this);
    $(this).toggleClass('active').siblings().removeClass('active');
    active_cell_row = $('.cell.active').attr("data-row");
    active_cell_col = $('.cell.active').attr("data-col");
  });

  $(document).keypress(function(event){
    if (event.key == "w") {
      active_cell_row += 1
    }
  })

});

var active_cell_row;
var active_cell_col;
