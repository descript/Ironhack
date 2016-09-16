(function() {

    var Pokemon = function(path,sprite_path) { //creating an object called Pokemon with a path and sprite_path attribute; later in the code we give "for the instances of Pokemon we create, those's prototypes get methods"
        this.path = path;
        this.sprite_path = sprite_path;
    };

    Pokemon.prototype.fetch = function(FnToApplyThisTo) { //in this app we are passing render through as FnToApplyThisTo
        var pokemon = this;
        $.ajax({
            type: "GET",
            url: this.path,
            success: function(response) {
                console.log(response);
                pokemon.name = response.name;
                pokemon.weight = response.weight;
                pokemon.height = response.height;
                pokemon.pokemon_id = response.pkdx_id;
                FnToApplyThisTo(pokemon);
            },
            error: function(err) {
                console.log('fail!');
                console.log(err);
            }
        })
    }

Pokemon.prototype.fetchsprite = function(FnToApplyThisTo){ //in this app we pass RenderImage through as FnToApplyThisTo
    var sprite = this;
    $.ajax({
        type: "GET",
        url: this.sprite_path,
        success: function(response) {
            sprite.image = response.image;
            FnToApplyThisTo(sprite);
        },
        error: function(err) {
            console.log('fail!');
            console.log(err);
        }
    })
}

    if (typeof Pokeapp === 'undefined') {
        window.Pokeapp = {};
    }
    window.Pokeapp.Pokemon = Pokemon;
})()
//anonymous and IIFE. so now we create it once then assign to Pokeapp then it disappears and does not pollute name spaces and its fully encapsulated
