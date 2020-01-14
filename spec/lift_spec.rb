require_relative '../models/lift'

# Passenger summons lift on the ground floor. Once in, chooses to go to level 5.
describe "Lift summoned on level 1. Once in, chooses to go to level 5" do
    it "the doors should open on level 1 & 5" do
        lift = Lift.new
        lift.add_instruction(1, "UP")
        lift.start_lift
        expect(lift.open_doors).to be true

        lift.add_instruction(5, "LIFT")
        lift.move_up
        lift.move_up
        lift.move_up
        lift.move_up
        expect(lift.open_doors).to be true
    end
end

# Passenger summons lift on level 6 to go down. A passenger on level 4 summons the lift to go down. They both choose L1.
describe "Passengers on L6 & L4 summon lift to go down to L1" do
    it "instructions reflect the description" do
        lift = Lift.new
        lift.add_instruction(6, "DOWN")
        lift.start_lift
        lift.add_instruction(4, "DOWN")
        expect(lift.instructions).to eq([{level: 6, type: "DOWN"}, {level: 4, type: "DOWN"}])

        lift.move_up
        lift.move_up
        lift.move_up
        lift.move_up
        lift.move_up
        expect(lift.max_floor_in_instructions).to eq(6)

        lift.change_directions
        expect(lift.current_direction).to eq("DOWN")
        expect(lift.open_doors).to be true

        lift.add_instruction(1, "LIFT")

        lift.move_down
        lift.move_down
        expect(lift.open_doors).to be true

        lift.add_instruction(1, "LIFT")
        lift.move_down
        lift.move_down
        lift.move_down
        expect(lift.open_doors).to be true
        expect(lift.instructions.length).to eq(0)
    end
end

# Passenger 1 summons lift to go up from L2. Passenger 2 summons lift to go down from L4. Passenger 1 chooses to go to L6. Passenger 2 chooses to go to Ground Floor
describe "L2 up. L4 down. Passenger 1 => L6. Passenger 2 => L1" do
    it "should reflect instructions" do
        lift = Lift.new
        lift.add_instruction(2, "UP")
        lift.start_lift
        lift.add_instruction(4, "DOWN")
        expect(lift.instructions).to eq([{level: 2, type: "UP"}, {level: 4, type: "DOWN"}])

        lift.move_up
        expect(lift.open_doors).to be true

        lift.add_instruction(6, "LIFT")
        expect(lift.max_floor_in_instructions).to eq(6)

        lift.move_up
        lift.move_up
        # does not open on level four at this time
        expect(lift.open_doors).to be false

        lift.move_up
        lift.move_up
        expect(lift.open_doors).to be true

        lift.change_directions
        lift.move_down
        lift.move_down
        expect(lift.open_doors).to be true

        lift.add_instruction(1, "LIFT")
        lift.move_down
        lift.move_down
        lift.move_down
        expect(lift.open_doors).to be true
    end
end

# Passenger 1 summons lift to go up from Ground. They choose L5. Passenger 2 summons lift to go down from L4. Passenger 3 summons lift to go down from L10. Passengers 2 and 3 choose to travel to Ground.
describe "P1 UP L1 => L5. P2 DOWN L4. P3 DOWN L10. P2 & P3 => L1" do
    it "should follow the instructions" do
        lift = Lift.new
        lift.add_instruction(1, "UP")
        lift.start_lift
        expect(lift.open_doors).to be true

        lift.add_instruction(5, "LIFT")
        lift.add_instruction(4, "DOWN")
        lift.add_instruction(10, "DOWN")
        expect(lift.max_floor_in_instructions).to eq(10)
        expect(lift.instructions).to eq([{level: 5, type: "LIFT"}, {level: 4, type: "DOWN"}, {level: 10, type: "DOWN"}])

        lift.move_up
        lift.move_up
        lift.move_up
        # should be false as lift still moving up
        expect(lift.open_doors).to be false

        lift.move_up
        expect(lift.open_doors).to be true

        lift.move_up
        lift.move_up
        lift.move_up
        lift.move_up
        lift.move_up
        lift.change_directions
        expect(lift.open_doors).to be true

        lift.add_instruction(1, "LIFT")

        # prewious instructions deleted when doors hae opened
        expect(lift.instructions).to eq([{level: 4, type: "DOWN"}, {level: 1, type: "LIFT"}])

        lift.move_down
        lift.move_down
        lift.move_down
        lift.move_down
        # level 6
        expect(lift.open_doors).to be false

        lift.move_down
        lift.move_down
        expect(lift.open_doors).to be true

        lift.add_instruction(1, "LIFT")
        expect(lift.instructions).to eq([{level: 1, type: "LIFT"}, {level: 1, type: "LIFT"}])
        lift.move_down
        lift.move_down
        lift.move_down

        expect(lift.open_doors).to be true
        expect(lift.instructions.length).to eq(0)

    end
end