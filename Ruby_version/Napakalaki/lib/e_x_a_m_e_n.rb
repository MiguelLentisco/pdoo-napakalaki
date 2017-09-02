# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/usr/bin/env ruby
#encoding: utf-8


class Test
  
  private
  def privado
    puts "privado"
  end
  
  protected 
  def protegido
    puts "Protegido"
  end
  
  public 
  def publico
    puts "Publico"
  end
  
  def otropublico(otro)
    #otro.privado
    otro.protegido
    otro.publico
  end  
 
end


class Hija < Test
  def metodo
    puts "Metodo"
    privado
    protegido
    publico
  end  
  
  def metodo2(otro)
    #otro.privado    # Mal, es privado, no se puede acceder desde otro objeto que no sea el
    otro.protegido
    otro.publico
  end    
  
  protected 
  def protegido
    puts "Protegido-Hija"
  end
  
  private
  def mm
    "hola"
  end
  
  
end

t=Test.new
#t.privado      # MAl, es privado
#t.protegido    # MAl, es protegido
t.publico

t.otropublico(Test.new)  

puts "======="

h=Hija.new
#h.privado
#h.protegido
#h.publico
#h.metodo
#h.metodo2(Test.new)

Test.new.otropublico(Hija.new)