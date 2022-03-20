$(document).on("turbolinks:load", function() {

    if ($("#profile-user").length > 0) {

        document.querySelector("#profile-submit").addEventListener("click", (e) => {
            e.preventDefault();

            const profile_name = document.querySelector('#name').value;
            const profile_age = document.querySelector('#age').value;
            const profile_note = document.querySelector('#note').value;
            const profile_address = document.querySelector('#address').value;
            const profile_phone = document.querySelector('#phone_number').value;

            $.ajax({
                type: 'POST',
                url: "/users/update_profile",
                dataType: 'json',
                data: {

                    user: {
                        name: profile_name,
                        note: profile_note,
                        phone_number: profile_phone,
                        age: profile_age
                    },

                    location: {
                        address: profile_address
                    }
                },

                success: function (resultData) { 
                    document.querySelector("#current_name").innerHTML = resultData.name;
                    document.querySelector("#current_note").innerHTML = resultData.note;
                    document.querySelector("#current_age").innerHTML = resultData.age;
                    document.querySelector("#current_phone").innerHTML = resultData.phone_number;
                    document.querySelector("#current_address").innerHTML = profile_address;
                                    
                }
            });
        });
    };
})