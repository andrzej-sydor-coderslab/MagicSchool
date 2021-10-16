
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.cookie.js"> </script>
<script src="js/lightbox.min.js"></script>
<script src="js/front.js"></script>
<script type="text/javascript">

$(document).ready(function() {

var last_valid_selection = null;

$('#spellBook').change(function(event) {

if ($(this).val().length > 3) {

$(this).val(last_valid_selection);
} else {
last_valid_selection = $(this).val();
}
});
});
</script>