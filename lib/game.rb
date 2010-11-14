require 'rubygems'
require 'gosu'
require 'enemy'
require 'tower'

class GameWindow < Gosu::Window
  attr_reader :enemies

  def initialize
    super(640, 480, false)
    self.caption = "Gosu Tutorial Game"
    @background = Gosu::Image.new(self, "media/sand.png", true)
    @tower = Tower.new(self)
    @enemies = []
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