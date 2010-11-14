class Fortress
  attr_reader :square, :damage

  def initialize(window)
    @window = window
    @image  = Gosu::Image.new(window, "media/fortress.png", false)
    @square = window.grid.square_at(rand(window.grid.width), window.grid.height - 3)
    @damage = 0
    @x, @y  = window.position_for(@square)
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end

  def damage!
    @damage += 1
    if @damage >= 15
      puts "You lose!"
      @window.close
    end
  end
end
