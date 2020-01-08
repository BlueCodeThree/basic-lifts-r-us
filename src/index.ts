import * as prompt from 'syncprompt';

const numberOfFloors: number = 10;
let currentFloor: number = 1;

enum Movement {
    up,
    down,
}

const checkFloorNumberExists = (floorNumber: number): boolean => {
    if (floorNumber > 0 && floorNumber <= numberOfFloors) {
        return true;
    } else {
        return false;
    }
}

const checkLiftUpDownButtonPressed = (userInput: string): Movement => {
    let inputArray = userInput.toUpperCase().split(" ");
    if (inputArray[0] === "UP") {
        return Movement.up;
    } else if (inputArray[0] === "DOWN") {
        return Movement.down;
    } else if (inputArray[0] === "PASS") {
        return 
    }
}

console.log("LIFT STARTED")

for (let floor = 1; floor <= numberOfFloors; floor++) {
    console.log(`LIFT IS AT FLOOR ${floor}`);
    const input: string = prompt("> ");
    if (input.toUpperCase() === "PASS") {
        console.log("it has been passed");
    } else {
        console.log("it hasn't been passed. ")
    }
}