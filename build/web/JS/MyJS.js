$("#entry-div").hide();
$("#update-pop").hide();

$(document).ready(function () {
    console.log("this is profile header");
    $("#check-buttn").click(function () {
        $("#entry-div").slideToggle(1000);

        $("#entry-form").on('submit', function (event) {
            event.preventDefault();

            var f = $(this).serialize();

            console.log(f);

            $(".ldr").show();


            $.ajax({
                url: "Entry",
                data: f,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $(".ldr").hide();
                    if (data.trim() === 'done') {
                        $("#update-pop").html("Aadhaar Info Saved");
                        $("#update-pop").show().delay(3000).fadeOut();
                        $("#entry-div").slideUp(1000);
                        $("#entry-form").trigger("reset");
                    } else {
                        $("#update-pop").html("Info Already Exist");
                        $("#update-pop").show().delay(3000).fadeOut();
                        $("#entry-div").slideUp(1000);
                        $("#entry-form").trigger("reset");
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(data);
                    console.log("Error!!    ");
                    if (data.trim() === 'error') {
                        $("#update-pop").html("Info Already Exist");
                        $("#update-pop").show().delay(3000).fadeOut();
                        $("#entry-div").slideUp(1000);
                        $("#entry-form").trigger("reset");
                    }
                    $(".ldr").hide();
                }
            })
        })


    });

});

