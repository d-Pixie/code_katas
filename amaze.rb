# A call to 'ruby maze.rb [WIDTH] [HEIGHT]' should be all that is needed for
# basic use.

class Maze

  DIRECTIONS = [:n, :s, :e, :w]

  class Room
    def initialize
      @walls = {n: true, s: true, e: true, w: true}
      @visited = false
    end

    def enter(direction)
      @walls[direction] = false if @walls[direction]
      @visited = true
    end

    def leave(direction)
      @walls[direction] = false if @walls[direction]
    end

    def visited?(direction)
      @visited
    end

  private
    def invert_direction(direction)
      case direction
        when :n
          return :s
        when :s
          return :n
        when :e
          return :w
        when :w
          return :e
      end
    end
  end

  def initialize(width ,height)
    @width = width
    @height = height
    @state = Array.new(x) { Array.new(y) { Room.new } }
    @x = (0..x-1);
    @y = (0..y-1);
  end

  def generate
    @state[@x][@y].enter(DIRECTIONS.sample)
  end

  def visit(x, y)
    possible_directions = [:n, :s, :e, :w].shuffle
    possible_directions.each do |direction|
      new_x, new_y = position_from_direction direction
      # Check that we are still inside the maze
      unless new_x >= @width or new_y >= @height or new_x < 0 or new_y < 0
        # Only visit each room once
        unless @state[new_x][new_y].visited?
          @state[x][y].leave direction
          @state[new_x][new_y].enter direction
      end
    end
  end

  def position_from_direction(direction)
    height_modifier = {n: -1, s: +1, e: 0, w: 0}
    width_modifier = {n: 0, s: 0, e: +1, w: -1}
    return @x+width_modifier[direction], @y+height_modifier[direction]
  end

  def to_s
    @state.inspect
  end
end

p Maze.new(ARGV[0].to_i,ARGV[1].to_i)
