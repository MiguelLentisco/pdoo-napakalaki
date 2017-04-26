# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class A
  def initialize
    @variable = "miVariable"
  end
  
end

class B < A
  def initialize
    super
  end
  
  def printeame
    puts @variable
  end
end

prueba = B.new
prueba.printeame