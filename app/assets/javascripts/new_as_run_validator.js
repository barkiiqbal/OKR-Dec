

$(function(){
$(".new_as_run").validate({
    rules : {
        "as_run[name]" :{

            required : true
        } ,
        "as_run[attachment]" :{

            required : true
        }
    },
    messages : {
        "as_run[name]" : {
            required : "Please enter name"
        },
        "as_run[attachment]" : {
            required : "Please attach file"
        }

    },
    errorPlacement: function(error, element) {

        error.insertAfter(element);
    }

});
});