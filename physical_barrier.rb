module PhysicalBarrier

  def zero_vector()
    CP::Vec2.new(0,0)
  end
  
  def infinity
    return 1/0.0
  end

  def create_pyhsical_barrier(x, y, a, collision_tag)
    moment_of_inertia, mass = infinity, infinity
    body = CP::Body.new(mass, moment_of_inertia)
    @shape = CP::Shape::Segment.new(body, start_vec, end_vec, 0)
    @shape.collision_type = collision_tag
    @shape.body.p = CP::Vec2.new(x,y)
    @shape.body.a = a
    @shape.e = elast if self.respond_to?("elast")
    @shape.u = fric if self.respond_to?("fric")
    @space.add_shape(@shape)
  end

  def draw_barrier(offset_x=0, offset_y=0)
    a = @shape.body.local2world(start_vec)
    b = @shape.body.local2world(end_vec)
    @window.draw_line(a.x+offset_x, a.y+offset_y, 0xFFFFFFFF, b.x+offset_x, b.y+offset_y, 0xFFFFFFFF, z=1, mode=:default)
  end

  private
  
  def start_vec
    zero_vector
  end

  def end_vec
    CP::Vec2.new(@length,0)
  end

end
