class PagesController < ApplicationController
    def home
      if(cookies[:customer_idd].present?)
        puts("ya estabaaaaaaaaa")
        puts(cookies[:customer_idd].to_s)
        begin
          Order.where(id:cookies[:current_order_idd]).first.id
        rescue => exception
          e = Order.new
          e.customer = Customer.where(id:cookies[:customer_idd]).first
          e.finished = false
          e.save!
          cookies[:current_order_idd] = e.id
          puts("tenia un carro pero estaba listo")
        end
        if(!(Order.where(id:cookies[:current_order_idd]).first.finished))
          puts(cookies[:current_order_idd].to_s)
        else
          e = Order.new
          e.customer = Customer.where(id:cookies[:customer_idd]).first
          e.finished = false
          e.save!
          cookies[:current_order_idd] = e.id
          puts("tenia un carro pero estaba listo")
        end
      else
        o = Customer.new
        o.save!
        cookies[:customer_idd] = o.id
        e = Order.new
        e.customer = o
        e.finished = false
        e.save!
        cookies[:current_order_idd] = e.id
        puts("user being saved")
      end
      puts("proccess finished")
      
    end
  end