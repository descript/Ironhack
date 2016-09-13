$(function() { //on ready
    $('.fetch_button').click(function() {
        console.log("You clicked the button");
        $.ajax({
            type: "GET",
            url: "http://ironhack-characters.herokuapp.com/characters",
            success: showCharacters,
            error: handleError
        });
    })


    $("form").submit(function(event) {
        event.preventDefault()
        console.log("posting!");

        var newCharacter = {
            name: this["name"].value,
            occupation: this["occupation"].value,
            weapon: this["weapon"].value
        };

        $.ajax({
            type: "POST",
            url: "https://ironhack-characters.herokuapp.com/characters",
            data: newCharacter,
            success: addCharacter(newCharacter),
            error: handleError
        });
    })

})


function showCharacters(response) {
    var characersArray = response;
    characersArray.forEach(function(character) {
        var char_li = $('<li>').text(character.name);
        $('.list').append(char_li);
    })
};

function handleError(error) {
    console.log("Error");
    console.log(error.responseText);
};

function addCharacter(newChar) {
    console.log("New character added");
    var new_char_li = $('<li>').text(newChar.name);
    $('.list').append(new_char_li);
};
