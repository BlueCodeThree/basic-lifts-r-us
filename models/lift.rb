class Lift
    attr_reader :top_floor, :instructions
    attr_accessor :current_floor, :current_direction, :max_floor_in_instructions, :min_floor_in_instructions
    def initialize
        @current_floor = 1
        @current_direction = "IDLE"
        @top_floor = 10
        @max_floor_in_instructions = 1
        @min_floor_in_instructions = 1
        @instructions = []
    end

    def add_instruction(level, type)
        @instructions << {level: level, type: type}
        set_top_floor_in_instructions
        set_bottom_floor_in_instructions
    end

    def start_lift
        instruction = @instructions[0][:level]
        if instruction > @current_floor || instruction == 1
            @current_direction = "UP"
        else
            @current_direction = "DOWN"
        end
    end

    def change_directions
        case @current_direction
        when "UP"
            @current_direction = "DOWN"
        when "DOWN"
            @current_direction = "UP"
        end
    end

    def move_up
        return @current_floor += 1
    end

    def move_down
        return @current_floor -= 1
    end

    def set_top_floor_in_instructions
        @max_floor_in_instructions = @instructions.max_by{|k| k[:level] }[:level].to_i
    end

    def set_bottom_floor_in_instructions
        @min_floor_in_instructions = @instructions.min_by{|k| k[:level] }[:level].to_i
    end

    def delete_instructions(instruction)
        instructions_with_current_floor_removed = @instructions.select { |i| i[:level] != @current_floor}
        @instructions = instructions_with_current_floor_removed
    end

    def open_doors
        @instructions.each do |instruction|
            case @current_direction
            when "UP"
                if (instruction[:type] == "UP" || instruction[:type] == "LIFT") && (@current_floor == instruction[:level])
                    delete_instructions(instruction)
                    return true
                end
            when "DOWN"
                if ( instruction[:type]== "DOWN" ||  instruction[:type]=="LIFT") && (@current_floor == instruction[:level])
                    delete_instructions(instruction)
                    return true
                end
            end
        end
        return false
    end
end