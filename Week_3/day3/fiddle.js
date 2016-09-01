// function checkInPassenger(name, customersArray) {
//   var passengerChecked;
//   for (var i=0; i<customersArray.length; i++) {
//     if (customersArray[i] == name) {
//       return function() {
//         console.log ("Hi, " + name + ". You're passenger #" + (i+1));
//       };
//     }
//   }
// }
//
// var flightToBali = ["Wayan", "Putu", "Gede", "Ni Luh", "Nyoman", "John"];
// var counterCheckIn = checkInPassenger("Gede", flightToBali);
// counterCheckIn();


// //return index pair of numbers that sum to 0
// var exampleArray = [2, -5, 10, 5, 4, -10, 0];
//
// function process(my_array) {
//     new_array = []
//     my_array.forEach(function(num, index) {
//         for (var i = 0; i < my_array.length; i++) {
//             if (num + my_array[i] === 0) {
//                 new_array.push(index + "," + i);
//             };
//         }
//     })
//     return new_array
// }
//
// var results = process(exampleArray);
// console.log(results);

// var numbers = "80:70:90:100";
//
// function averageColon(my_string) {
//     var my_array = my_string.split(":");
//     var length = my_array.length;
//     var sum = my_array.reduce(function(first, next) {
//         return parseInt(first) + parseInt(next);
//     });
//     return sum / length;
// }
//
//
// console.log(averageColon(numbers) === 85);

// var words = ["darling", "bygone", "landing", "cheaply", "assumed", "incorrectly", "attention", "agent"];
// var words2 = ["January", "lacks", "caveats", "hazardous", "DOORS", "crying", "arrogantly", "climate", "proponent", "rebuttal"];
var sentence = "fill the proper tank for the cow";


function decoder(word_array) {
    var results = [];
    word_array.forEach(function(word, index) {
        var i = index % 5;
        results.push(word[i]);
    })
    return results.join("");
}


function super_decode(sentence, order) {
    sent_array = sentence.split(" ");
    new_array = [];

    if (order.includes("even")) {
        var e_or_o=2;
    }
    else if (order.includes("odd")) {
        var e_or_o=1;
    }

    sent_array.forEach(function(word, index) {
        if (index % e_or_o === 0) {
            new_array.push(word);
        }
    })
    if (order.includes("backwards")) {
        return decoder(new_array.reverse());
    }
    else if (order.includes("forwards")) {
        return decoder(new_array);
    }

}

// message = decoder(words2);
message = super_decode(sentence,"even-backwards");
console.log(message);
