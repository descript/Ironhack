function cipherBuilder(shift) {
    return function(message) {
        if (shift == null) {
            shift = -3;
        }
        array = message.split("")
        var shifted = array.map(function(item) {
            if (item >= "A" && item <= "Z") {
                return (((item.charCodeAt(0) - 65 + shift) % 26) + 65);
            } else if (item >= "a" && item <= "z") {
                return (((item.charCodeAt(0) - 97 + shift) % 26) + 97);
            } else {
                return item.charCodeAt(0);
            }
        });
        var final = shifted.map(function(num) {
            return String.fromCharCode(num);
        });
        console.log(final.join(""));
    };
}

// var encrypted = caesarCipher("Et tu, brute?", 6);
// console.log(encrypted)

var encrypted = cipherBuilder(6);
encrypted("Et tu, brute?");
