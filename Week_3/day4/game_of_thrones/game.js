var fs = require('fs');

function fileActions(err, file) {
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    // var srchin = searchFor("Jon");
    var name = "Jon"
    // episodes = filterepisodes(episodes)
    var newEpisodes = episodes.sort(function(a, b) {
        return a.episode_number - b.episode_number
    });

    function searchFor(name,index) {
        if (episodes[index].description.indexOf(name) > -1) {
            console.log("Jon Snow found.");
        }
    }

    for (var episode in newEpisodes) {
        console.log("------------------------------------------")
        searchFor("Jon",episode)
        console.log("Title : " + newEpisodes[episode].title);
        console.log("Number : " + newEpisodes[episode].episode_number);
        console.log("Description : " + newEpisodes[episode].description);
        console.log("Rating : " + newEpisodes[episode].rating + " " + "*".repeat(episodes[episode].rating));
    }
}

function filterepisodes(episodes_array) {
    var filtered = episodes_array.filter(function(episode) {
        return episode.rating > 8.5;
    });
    return filtered
}


fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);
