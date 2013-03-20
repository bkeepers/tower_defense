require 'gosu'
require_relative 'a_star'
require_relative 'grid'
require_relative 'square'
require_relative 'enemy'
require_relative 'fortress'
require_relative 'tower'

class GameWindow < Gosu::Window
  attr_reader :grid, :enemies, :fortress

  def initialize
    super(600, 400, false)
    self.caption  = "Gosu Tutorial Game"
    @background   = Gosu::Image.new(self, "media/sand.png", true)
    @grid         = Grid.new(30, 20)
    @fortress     = Fortress.new(self)
    @enemies      = []
    @towers       = []
  end

  def position_for(square)
    [square.x * 20, square.y * 20]
  end

  def square_at(x, y)
    grid.square_at((x / 20).to_i, (y / 20).to_i)
  end

  def update
    @enemies.each {|e| e.update }

    if rand(100) < 4 and @enemies.size < 10 then
      @enemies << Enemy.new(self)
    end
  end

  def needs_cursor?
    true
  end

  def draw
    @background.draw(0, 0, 0)
    @fortress.draw
    @towers.each  {|t| t.draw }
    @enemies.each {|e| e.draw }
  end

  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      close
    when Gosu::Button::MsLeft
      add_tower
    end
  end

  def add_tower
    @towers << Tower.new(self, square_at(mouse_x, mouse_y))
    @enemies.each {|e| e.update_path }
  end
end

window = GameWindow.new
window.show
