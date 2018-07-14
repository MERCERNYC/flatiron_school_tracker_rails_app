#Flatiron School Tracker Application

#Step 1: Integrate Basic Theme
  -non-dynamic, page with the theme
#Step 2: Allow students to CRUD school Topics
  -create a topic
  -see all their topics
  -show a topic


    <% form_for @topics do |f| %>

      <div class="form-group">
        <%= f.label :Name %>
        <%= f.text_field :name %>
      </div>

      <div class="form-group">
        <%= f.label :Timeline %>
        <%= f.text_field :timeline %>
      </div>

      <div class="form-group">
        <%= f.label :Note %>
        <%= f.text_field :note %>
      </div>

      <% end %>
