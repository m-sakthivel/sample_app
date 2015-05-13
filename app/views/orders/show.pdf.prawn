prawn_document(:page_layout => :landscape) do |pdf|
    pdf.text "Order ##{@order.id}", :size => 30, :style => :bold
    
      pdf.move_down 20
      
      pdf.text "Order name: #{@order.order_name}", :size => 10
      pdf.text "Order Date: #{@order.order_date}", :size => 10

    
end