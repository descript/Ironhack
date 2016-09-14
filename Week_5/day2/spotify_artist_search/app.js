$(function() { //on ready

    var Spotify = function() {};

    Spotify.prototype.start = function() {
        var spotifythis = this
        $('.search_form').submit(function(event) {
            event.preventDefault()
            var searchterm = this["artist"].value
            spotifythis.searchAPI(searchterm);
        })
    }

    Spotify.prototype.searchAPI = function(query) {
        $.ajax({
            type: "GET",
            url: "https://api.spotify.com/v1/search?type=artist&query=" + query,
            success: artistList,
            error: handleError
        });
    }

    var spotifyInstance = new Spotify();
    spotifyInstance.start();
})

function artistList(response) {
    var artist_array = response.artists.items;
    artist_array.forEach(function(artist,index) {
        // var i = index;
        // var artist_list_item = $('<li>').text(artist.name);
        var artist_image = "<img height='300' width='300'src=" + artist.images[1].url + ">";
        // $('.results').append(artist_list_item);
        $('.results').append($('<li class="image">').html(artist_image));
        modalCreator(artist_image, $('<p>').text(artist.name),index)
    })
};

function handleError(error) {
    console.log("Error");
    console.log(error.responseText);
};

function modalCreator(image,content,index)
    var outer_div = $("<div class='modal fade bs-example-modal-lg outer' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>");
    var middle_div = $("<div class='modal-dialog modal-lg middle' role='document'>");
    var inner_div = $("<div class='modal-content inner'>");

    $('img').wrap("<a class='btn' data-toggle='modal' data-target='.bs-example-modal-lg'>");
    $('a').after(outer_div);
    $('.outer').append(middle_div);
    $('.middle').append(inner_div);
    $('.inner').append(content);
};
