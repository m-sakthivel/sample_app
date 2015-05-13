pdf.text "Order ##{@order.id}", :size => 30, :style => :bold

pdf.move_down(30)

<table>
  <thead>
    <tr>
      <th>Order name</th>
      <th>User</th>
      <th>Order date</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @orders.each do |order| %>
      <tr>
        <td><%= order.order_name %></td>
        <td><%= order.user_id %></td>
        <td><%= order.order_date %></td>
        <td><%= link_to 'Show', order %></td>
        <td><%= link_to 'Edit', edit_order_path(order) %></td>
        <td><%= link_to 'Destroy', order, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

items = @order.map do |item|
  [
    item.name
    
  ]
end

pdf.table items, :border_style => :grid,
  :row_colors => ["FFFFFF","DDDDDD"],
  :headers => ["Product"],
  :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }

pdf.move_down(10)

