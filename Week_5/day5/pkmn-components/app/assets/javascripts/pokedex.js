(function() {

var PokedexClass = function() {};

    PokedexClass.prototype.start = function() {
        var pokedex = this;
        $('.js-show-pokemon').click(function(event) {
            var clickEl = $(event.currentTarget);
            var path = clickEl.attr('data-pokemon-uri');
            var sprite_path = path.replace("pokemon","sprite");
            var pokemon = new window.Pokeapp.Pokemon(path,sprite_path);
            pokemon.fetch(pokedex.render);
            pokemon.fetchsprite(pokedex.imageRender);
        });
    }

    PokedexClass.prototype.render = function (pokemon) {
        $('#name').text(pokemon.name);
        $('#height').text(pokemon.height);
        $('#weight').text(pokemon.weight);
        $('#pokemon_id').text(`#${pokemon.pokemon_id}`);
        $('.modal').modal({keyboard: true})
        $('.modal').modal('show');
    }

    PokedexClass.prototype.imageRender = function (sprite) {
        $('#pokemon_sprite').attr('src',`http://pokeapi.co${sprite.image}`);
        // $('.modal').modal('show');
    }

    if (typeof Pokeapp === 'undefined') {
        window.Pokeapp = {};
    }
    window.Pokeapp.Pokedex = PokedexClass;
})()
