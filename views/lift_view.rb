class LiftView
    def start
        puts "LIFT STARTED"
    end

    def idle(current_floor)
        puts "LIFT IS IDLE AT LEVEL #{current_floor}"
    end

    def instruction
        return gets.strip
    end

    def lift_called(level, direction)
        puts "LEVEL #{level} #{direction} ILLUMINATED"
    end

    def start_lift

    end

    def move_up(current_floor)
        puts ""
        puts "LIFT MOVES UP TO LEVEL #{current_floor}"
    end

    def display_current_instructions(instructions)
        instructions.each do |instruction|
            instruction.each do |level, direction|
                puts "LEVEL #{level} ILLUMINATED"
            end
        end
    end

    def open_doors
        puts ""
        puts "LIFT DOORS OPEN"
    end

    def close_doors
        puts ""
        puts "LIFT DOORS CLOSE"
    end
end