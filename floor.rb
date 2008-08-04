require 'rubygems'
require "enumerator"
require 'physical_barrier'
include PhysicalBarrier

class Floor

  def initialize(window, space, x, y, angle, length)
    @window = window
    @space = space
    @length = length
    create_pyhsical_barrier(x, y, angle, :floor)
  end

  def draw
      draw_barrier
  end

  def fric
    0.7
  end

  def elast
    0.1
  end

end
