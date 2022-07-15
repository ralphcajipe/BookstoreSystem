<style>
    #uni_modal .modal-content>.modal-footer,
    #uni_modal .modal-content>.modal-header {
        display: none;
    }
</style>
<div class="container-fluid">

    <div class="row">
        <h3 class="float-right">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </h3>
        <div class="col-lg-12">
            <h3 class="text-center">Login</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="text" class="form-control form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="create_account">Create Account</a>
                    <button class="btn btn-primary btn-flat">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    /* A jQuery function that is called when the DOM is ready. */
    $(function() {
        /* Calling the `uni_modal` function. */
        $('#create_account').click(function() {
            uni_modal("", "registration.php", "mid-large")
        })
        /* Preventing the default action of the form. */
        $('#login-form').submit(function(e) {
            e.preventDefault();
            start_loader()
            if ($('.err-msg').length > 0)
                $('.err-msg').remove();
            /* Sending a POST request to the server. */
            $.ajax({
                url: _base_url_ + "classes/Login.php?f=login_user",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                /* A callback function that is called when an error occurs. */
                error: err => {
                    console.log(err)
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                /* This is a callback function that is called when the request is successful. */
                success: function(resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Login Successfully", 'success')
                        setTimeout(function() {
                            location.reload()
                        }, 2000)
                    }
                    /* Checking if the response from the server is an object and if the status is
                    incorrect. If it is, it will create a div element and add a class to it. It
                    will also add text to the div element. */
                    else if (resp.status == 'incorrect') {
                        var _err_el = $('<div>')
                        _err_el.addClass("alert alert-danger err-msg").text("Incorrect Credentials.")
                        $('#login-form').prepend(_err_el)
                        end_loader()

                    }
                    /* A callback function that is called when the request is successful. */
                    else {
                        console.log(resp)
                        alert_toast("an error occured", 'error')
                        end_loader()
                    }
                }
            })
        })
    })
</script>