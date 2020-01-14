class Lift
    attr_reader :top_floor, :instructions
    attr_accessor :current_floor, :current_direction
    def initialize
        @current_floor = 1
        @current_direction = "IDLE"
        @top_floor = 10
        @instructions = []
    end

    def add_instruction(level, type)
        @instructions << {level: level, type: type}
        puts @instructions
    end

    def start_lift
        @current_direction = "UP"
    end

    def move_up
        return @current_floor += 1
    end

    def top_floor_in_instructions
        return @up_instructions.max
    end

    def bottom_floor_in_instructions
        return @down_instructions.min
    end

    def open_door
        if @current_direction == "UP"
            @up_instructions.each do |instruction|
                if @current_floor == instruction
                    return true
                end
            end
        elsif @current_direction == "DOWN"
            @down_instructions.each do |instruction|
                if @current_floor == instruction
                    return true
                end
            end
        end
        return false
    end
end