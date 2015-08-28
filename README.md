




###Setup
  run rake db:create in terminal
      rake db:test:prepare

      <table class="table table-striped">
        <tr>
          <th>Name</th>
          <th>City, State</th>
        </tr>
        <% @bands.each do |band| %>
          <tr>
            <td><%= band.name %></td>
            <td><%= band.city %>, <%= band.state%> </td>
          </tr>
        <% end %>
      </table>
