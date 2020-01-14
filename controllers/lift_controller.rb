require_relative '../models/lift.rb'
require_relative '../views/lift_view.rb'

class LiftController
    def initialize
        @lift_view = LiftView.new
        @lift_model = Lift.new
    end

    def startup
        @lift_view.start
        @lift_view.idle(@lift_model.current_floor)
        get_instruction
        @lift_model.start_lift
    end

    def get_instruction
        loop do
            instruction = @lift_view.instruction.upcase.split(" ")
            level = instruction[4].to_i
            direction = instruction[0]
            case direction
            when "UP"
                @lift_model.add_instruction(level, direction)
                @lift_view.lift_called(level, direction)
            when "DOWN"
                @lift_model.add_instruction(level, direction)
                @lift_view.lift_called(level, direction)
            when "PASS"
                return
            when "1", "2", "3","4", "5", "6", "7", "8", "9", "10"
                @lift_model.add_instruction(direction.to_i, "LIFT")
                @lift_view.floor_pressed_in_lift(direction)
            end
        end
    end

    def doors_should_open
        return @lift_model.open_doors
    end

    def open_doors
        @lift_view.open_doors
        get_instruction
        @lift_view.close_doors
    end

    def check_lift_stop
        if @lift_model.instructions.length == 0
            @lift_model.current_direction = "IDLE"
            @lift_view.idle(@lift_model.current_floor)
            return true
        end
        return false
    end

    def move_up
        while @lift_model.current_floor < @lift_model.top_floor
            @lift_view.move_up(@lift_model.move_up)
            if doors_should_open
                open_doors
                if @lift_model.current_floor == @lift_model.max_floor_in_instructions
                    return check_lift_stop
                end
                return
            end
            @lift_view.display_current_instructions(@lift_model.instructions)
            get_instruction
        end
    end

    def operate
        startup
        loop do
            lift_direction = @lift_model.current_direction
            case lift_direction
            when "UP"
                move_up
            when "DOWN"
            when "IDLE"

            when "QUIT"
            end
        end
    end
end