
require_relative 'cell'

class Board
  attr_accessor :cell_array
  def initialize(x,y)
    @x = x
    @y = y
    @cell_array = Array.new(@x) { Array.new(@y) {Cell.new} }
  end

  def paint
    @cell_array.each do |x|
      str = ""
      x.each do |y|
        str+= y.state.to_s + ' '
      end
      puts str
    end
  end

  def god
    #sum_array = Array.new(@x) { Array.new(@y){ 0 } }
    aux = []
    @cell_array.each_with_index do |x, xi|
      x.each_with_index do |y, yi|
        x_start= xi == 0 ? 0 : xi-1
        x_final = xi== @x-1 ? @x-1 : xi+1
        y_start = yi == 0 ? 0 : yi-1
        y_final = yi== @y-1 ? @y-1 : yi+1
        auxSum = 0
        (x_start).upto(x_final) do |ix|
          (y_start).upto(y_final) do |iy|
            if(ix == xi and iy == yi)
            else
              auxSum += @cell_array[ix][iy].state
            end
          end
        end
      aux << y if (y.state == 1 and !(auxSum == 2 || auxSum == 3))
      aux << y if (y.state == 0 and auxSum == 3)
      end
    end
    judge(aux)
    paint
  end

  def judge aux
    puts "\n\n"
    aux.each do |cel|
      if cel.state==1
        cel.state = 0
      else
        cel.state = 1
      end
    end
  end



end





