$(function() {
    var rows = 10;
    var cols = 10;
    var cells = [];
    // var even = true;
    function createGrid(root) {
        for (var i = 0; i < cols; i++) {
            for (var j = 0; j < cols; j++) {
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
        $(this).toggleClass('active').siblings().removeClass('active');
        active_cell_row = $('.cell.active').attr("data-row");
        active_cell_col = $('.cell.active').attr("data-col");
    });

    $(document).keypress(function(event) {
        if (event.which == "119") { //w==119 | UP
            active_cell_row = active_cell_row * 1 - 1
        } else if (event.which == "115") { //s==97| DOWN
            active_cell_row = active_cell_row * 1 + 1
        } else if (event.which == "97") { //a==115 | LEFT
            active_cell_col = active_cell_col * 1 - 1
        } else if (event.which == "100") { //d==100 | RIGHT
            active_cell_col = active_cell_col * 1 + 1
        }
        // wrap-around behavior
        if (active_cell_row < 0) {active_cell_row = 9;}
        if (active_cell_col < 0) {active_cell_col = 9;}
        active_cell_row = active_cell_row % 10
        active_cell_col = active_cell_col % 10
        //reassign title of "active cell" based on new numerical coordinates
        var target_cell = $('.cell[data-row="' + active_cell_row + '"][data-col="' + active_cell_col + '"]');
        target_cell.toggleClass('active').siblings().removeClass('active');
    });

});

var active_cell_row;
var active_cell_col;
