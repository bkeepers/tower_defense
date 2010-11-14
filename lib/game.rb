require 'rubygems'
require 'gosu'

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

class Enemy
  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "media/enemy.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def update
    @x += 1
    @y += 1
    if @x > @window.width || @y > @window.height
      @window.enemies.delete(self)
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.25, 0.25)
  end
end

class Tower
  # damage

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "media/tower.png", false)
    @x = rand(@window.width - 20) + 10
    @y = @window.height - 60
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end

# class Board
# end

window = GameWindow.new
window.show