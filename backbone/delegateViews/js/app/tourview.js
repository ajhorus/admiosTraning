App.Views.TourView = Backbone.View.extend({  
 template: _.template(
    "<h1>Great tours</h1>"),
  initialize: function(){
    this.render();
  },
  render: function() {
    var html = this.template({});
    this.tourElemntsView =  new App.Views.TourElemntsView({collection:this.collection, el: $('#app')});
    this.tourElemntsView.render();
    this.$el.html(html);
    return this
  }
});