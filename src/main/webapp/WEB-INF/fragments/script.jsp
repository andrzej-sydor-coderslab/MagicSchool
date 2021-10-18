<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="../../game.js"></script>
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