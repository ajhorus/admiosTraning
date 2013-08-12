App.Views.TourView = Backbone.View.extend({  
  template: _.template(
    "<ul> \
      <% $.each(tours,function(key,name) { %> \
        <%= tourTemplate(name) %> \
      <% }); %> \
    </ul>"),

  tourTemplate: _.template(
    "<li><%= name %></li>"
  ),

  initialize: function() {
      this.collection.bind('reset', this.render, this);
  },

  render: function() {
    var html = this.template({
      tours: this.collection.toJSON(),
      tourTemplate: this.tourTemplate
    });
    $(this.el).append(html);
    return this
  }
});