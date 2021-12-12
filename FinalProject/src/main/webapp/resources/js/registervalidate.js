
function validate_inputs() {
    // Validate user id
    const userid = $("#userid").val();
    if (userid.length === 0) {
        $("#userid").addClass("wronginput");
        $("#id_inputfield .wrongalarm").css("display", "block");
        $("#id_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#userid").removeClass("wronginput");
        $("#id_inputfield .wrongalarm").css("display", "none");
        $("#id_inputfield .validalarm").css("display", "block");
    }

    // Validate user password
    const password = $("#userpassword").val();
    if (password.length === 0) {
        $("#userpassword").addClass("wronginput");
        $("#pw_inputfield .wrongalarm").css("display", "block");
        $("#pw_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#userpassword").removeClass("wronginput");
        $("#pw_inputfield .wrongalarm").css("display", "none");
        $("#pw_inputfield .validalarm").css("display", "block");
    }

    // Validate user password again
    const password_val = $("#uservalpassword").val();
    if (password !== password_val || password_val.length === 0) {
        $("#uservalpassword").addClass("wronginput");
        $("#pwconfirm_inputfield .wrongalarm").css("display", "block");
        $("#pwconfirm_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#uservalpassword").removeClass("wronginput");
        $("#pwconfirm_inputfield .wrongalarm").css("display", "none");
        $("#pwconfirm_inputfield .validalarm").css("display", "block");
    }

    // Validate user first name
    const userFirstName = $("#userfirstname").val();
    const re_name = /^[A-Z][A-Za-z]*$/;
    if (!re_name.test(userFirstName)) {
        $("#userfirstname").addClass("wronginput");
        $("#firstname_inputfield .wrongalarm").css("display", "block");
        $("#firstname_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#userfirstname").removeClass("wronginput");
        $("#firstname_inputfield .wrongalarm").css("display", "none");
        $("#firstname_inputfield .validalarm").css("display", "block");
    }

    // Validate user Last name
    const userLastName = $("#userlastname").val();
    if (!re_name.test(userLastName)) {
        $("#userlastname").addClass("wronginput");
        $("#lastname_inputfield .wrongalarm").css("display", "block");
        $("#lastname_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#userlastname").removeClass("wronginput");
        $("#lastname_inputfield .wrongalarm").css("display", "none");
        $("#lastname_inputfield .validalarm").css("display", "block");
    }

    /* how to get values from radio inputs: https://loomio.tistory.com/28 */
    const gubun = $('input[name="gubun"]:checked').val();
    if (gubun === undefined) {
        $("#registeras_inputfield .wrongalarm").css("display", "block");
        $("#registeras_inputfield .validalarm").css("display", "none");
    }
    else {
        $("#registeras_inputfield .wrongalarm").css("display", "none");
        $("#registeras_inputfield .validalarm").css("display", "block");
    }
}

function init() {
    $(".signin_submit").click((e) => {
        // Validate user id
        if ($("#userid").val().length >= 30) {
            e.preventDefault();
            e.stopPropagation();
            alert("ID should be less then 30 letters");
            return;
        }
        const userid = $("#userid").prop("disabled");
        if (userid === false) {
            e.preventDefault();
            e.stopPropagation();
            alert("Validate your ID!");
            return;
        }

        // Validate user password
        const password = $("#userpassword").val();
        if (password.length >= 30) {
            e.preventDefault();
            e.stopPropagation();
            alert("Password should be less then 30 letters");
            return;
        }
        if (password.length === 0) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your password!");
            return;
        }

        // Validate user password again
        const password_val = $("#uservalpassword").val();
        if (password_val.length >= 30) {
            e.preventDefault();
            e.stopPropagation();
            alert("Password validation should be less then 30 letters");
            return;
        }
        if (password !== password_val) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your confirm-password!");
            return;
        }

        // Validate user first name
        const userFirstName = $("#userfirstname").val();
        if (userFirstName.length >= 30) {
            e.preventDefault();
            e.stopPropagation();
            alert("First name should be less then 30 letters");
            return;
        }
        const re_name = /^[A-Z][A-Za-z]*$/;
        if (!re_name.test(userFirstName)) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your firstname! First name should start with capital letters, and should contain only alphabets!");
            return;
        }

        // Validate user Last name
        const userLastName = $("#userlastname").val();
        if (userLastName.length >= 30) {
            e.preventDefault();
            e.stopPropagation();
            alert("Last name should be less then 30 letters");
            return;
        }
        if (!re_name.test(userLastName)) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your lastname! Last name should start with capital letters, and should contain only alphabets!");
            return;
        }

        /* how to get values from radio inputs: https://loomio.tistory.com/28 */
        const gubun = $('input[name="gubun"]:checked').val();
        if (gubun === undefined) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your type!");
            return;
        }
        $("#userid").prop("disabled", false);
    });


    $("#id_valid_button").click((e) => {
        e.preventDefault();
        e.stopPropagation();
        if ($("#userid").val().trim() === "") {
            alert("Id is empty!");
            return;
        }
        if ($("#userid").val().length >= 30) {
            alert("ID should be less then 30 letters");
            return;
        }

        $.ajax({
            url: 'validate/validateID.jsp',
            type: 'post',
            data: { "id": $("#userid").val().trim() },
            success: function (rs) {
                rs = rs.trim();
                console.log(rs);
                if (rs === "true") {
                    $("#userid").prop("disabled", true);
                    $("#id_valid_button").prop("disabled", true);
                } else {
                    alert("ID already exists! Please select other ID.");
                }
            }
        });
    });

    $("#userid").on("input", validate_inputs);
    $("#userpassword").on("input", validate_inputs);
    $("#uservalpassword").on("input", validate_inputs);
    $("#userfirstname").on("input", validate_inputs);
    $("#userlastname").on("input", validate_inputs);
    // detecting radio input change https://huskdoll.tistory.com/942
    $("input[name='gubun']:radio").change(validate_inputs);
}

init();