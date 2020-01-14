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
            when "DOWN"
                @lift_model.add_instruction(level, direction)
            when "PASS"
                return
            end
            @lift_view.lift_called(level, direction)
        end
    end

    def doors_should_open
        return @lift_model.open_door
    end

    def open_doors
        @lift_view.open_doors
        get_instruction
        @lift_view.close_doors
    end

    def move_up
        while @lift_model.current_floor < @lift_model.top_floor
            @lift_view.move_up(@lift_model.move_up)
            if doors_should_open
                open_doors
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
            when "WAIT"
            when "IDLE"
            when "QUIT"
            end
        end
    end
end