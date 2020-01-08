"use strict";
exports.__esModule = true;
var prompt = require("syncprompt");
var numberOfFloors = 10;
var currentFloor = 1;
var checkFloorNumberExists = function (floorNumber) {
    if (floorNumber > 0 && floorNumber <= numberOfFloors) {
        return true;
    }
    else {
        return false;
    }
};
console.log("LIFT STARTED");
for (var floor = 1; floor <= numberOfFloors; floor++) {
    console.log("LIFT IS AT FLOOR " + floor);
    var input = prompt("> ");
    if (input.toUpperCase() === "PASS") {
        console.log("it has been passed");
    }
    else {
        console.log("it hasn't been passed. ");
    }
}
