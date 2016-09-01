// var Car = function(model,noise){
//   this.model = model;
//   this.noise = noise;
//   this.wheels = 4;
//
//   // this.makeNoise = function() {
//     // console.log(this.noise);
//   // }
// };
//
//
// Car.prototype.makeNoise = function() {
//   console.log(this.noise);
// };
//
//
// buick = new Car("lacrosse","weeewooo");
// buick.makeNoise();

// function sleep(seconds,callback) {
//   setTimeout(callback, seconds * 1000);
// };
//
//
// sleep(10, function(){
//   console.log("It has been 10 seconds");
// });

//should make an array of 10 to 1
array = [134, 72, 93];
var i = 0;
var limit = array.length
function printer(array) {
    // if (i >= 0) {
        // i = i - 1;
        console.log((array[i]))
        i++;
        if (i==limit) {
            return
        }
    // }
    setTimeout(printer(array),1000);
    printer(array);

}


(printer(array))
