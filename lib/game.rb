require 'rubygems'
require 'gosu'
require 'a_star'
require 'grid'
require 'enemy'
require 'tower'

class GameWindow < Gosu::Window
  attr_reader :grid, :enemies, :tower

  def initialize
    super(600, 400, false)
    self.caption  = "Gosu Tutorial Game"
    @background   = Gosu::Image.new(self, "media/sand.png", true)
    @grid         = Grid.new(30, 20)
    @tower        = Tower.new(self)
    @enemies      = []
  end

  def position_for(square)
    [square.x * 20, square.y * 20]
  end

  def update
    @enemies.each {|e| e.update }

    if rand(100) < 4 and @enemies.size < 10 then
      @enemies << Enemy.new(self)
    end
  end

  def draw
    @background.draw(0, 0, 0)
    @tower.draw
    @enemies.each {|e| e.draw }
  end

  def button_down(id)
    close if id == Gosu::Button::KbEscape
  end
end

# class Board
# end

window = GameWindow.new
window.show