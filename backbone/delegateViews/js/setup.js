$(function(){
	var tours = new App.Collections.Tours();
	tours.reset([
		{
			name: "Lovely Tour"	        
		},
		{
			name: "Romantic Tour"
		},
		{
	    name: "Awesome Tour"
		}
	]);
	var tourView = new App.Views.TourView({collection:tours});
	$('#head').html(tourView.render().el);
});