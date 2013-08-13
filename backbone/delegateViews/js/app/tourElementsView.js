App.Views.TourElemntsView = Backbone.View.extend({
	template: _.template(
    "<ul> \
      <% $.each(tours,function(key,name) { %> \
        <%= tourTemplate(name) %> \
      <% }); %> \
    </ul>"),

  tourTemplate: _.template(
    "<li><%= name %></li>"
  ),

  showTours: function() {
    var html = this.template({
      tours: this.collection.toJSON(),
      tourTemplate: this.tourTemplate
    });
    this.$el.html(html);
  }
});