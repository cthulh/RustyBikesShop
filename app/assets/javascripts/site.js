$(document).on('ready page:load', function(){
	// leave a rating
	$('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
	// rating left with a comment
	$('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});