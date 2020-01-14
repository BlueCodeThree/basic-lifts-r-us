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
        puts @instructions
    end

    def start_lift
        @current_direction = "UP"
    end

    def move_up
        return @current_floor += 1
    end

    def set_top_floor_in_instructions
        @max_floor_in_instructions = @instructions.max_by{|k| k[:level] }[:level]
        puts @top_floor_in_instructions
    end

    def bottom_floor_in_instructions
        if @current_floor == @instructions.min_by{|k| k[:level] }
        end
    end

    def open_doors
        @instructions.each do |instruction|
            case @current_direction
            when "UP"
                if (instruction[:type] == "UP" || instruction[:type] == "LIFT") && (@current_floor == instruction[:level])
                    set_top_floor_in_instructions
                    delete_instructions = @instructions.select { |instruction| instruction[:level] != @current_floor }
                    @instructions = delete_instructions
                    return true
                end
            when "DOWN"
                if ( instruction[:type]== "DOWN" ||  instruction[:type]=="LIFT") && (@current_floor == instruction[:level])
                    return true
                end
            end
        end
        return false
    end
end