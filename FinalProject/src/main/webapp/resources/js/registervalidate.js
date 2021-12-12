function init() {
    $(".signin_submit").click((e) => {
        let validated = true;
        // Validate user id
        console.log("userid: ", $("#userid").val());
        const userid = $("#userid").prop("disabled");
        if (userid === false) {
            e.preventDefault();
            e.stopPropagation();
            alert("Validate your ID!");
            validated = false;
            return;
        }

        // Validate user password
        console.log("password: ", $("#userpassword").val());
        const password = $("#userpassword").val();
        if (password.length === 0){
            e.preventDefault();
            e.stopPropagation();
            alert("Check your password!");
            validated = false;
            return;
        }

        // Validate user password again
        console.log("validatepassword: ", $("#uservalpassword").val());
        const password_val = $("#uservalpassword").val();
        if (password !== password_val) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your confirm-password!");
            validated = false;
            return;
        }

        // Validate user first name
        console.log("firstname: ", $("#userfirstname").val());
        const userFirstName = $("#userfirstname").val();
        const re_name = /^[A-Z][A-Za-z]*$/;
        if (!re_name.test(userFirstName)) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your firstname!");
            validated = false;
            return;
        }

        // Validate user Last name
        console.log("lastname: ", $("#userlastname").val());
        const userLastName = $("#userlastname").val();
        if (!re_name.test(userLastName)) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your lastname!");
            validated = false;
            return;
        }

        /* how to get values from radio inputs: https://loomio.tistory.com/28 */
        console.log("gubun: ", $('input[name="gubun"]:checked').val());
        const gubun = $('input[name="gubun"]:checked').val();
        if (gubun === undefined) {
            e.preventDefault();
            e.stopPropagation();
            alert("Check your type!");
            validated = false;
            return;
        }
        if (validated) {
            $("#userid").prop("disabled", false);
            console.log("SUCCESSED");
        } else {
            console.log("FAILED");
        }
    });
}

function validate_inputs(){
    // Validate user id
    console.log("userid: ", $("#userid").val());
    const userid = $("#userid").val();
    if (userid.length === 0) {
        $("#userid").addClass("wronginput");
        $("#id_inputfield .wrongalarm").css("display", "block");
        $("#id_inputfield .validalarm").css("display", "none");
        console.log("wrong id");
    }
    else{
        $("#userid").removeClass("wronginput");
        $("#id_inputfield .wrongalarm").css("display", "none");
        $("#id_inputfield .validalarm").css("display", "block");
        console.log("good id");
    }

    // Validate user password
    console.log("password: ", $("#userpassword").val());
    const password = $("#userpassword").val();
    if (password.length === 0) {
        $("#userpassword").addClass("wronginput");
        $("#pw_inputfield .wrongalarm").css("display", "block");
        $("#pw_inputfield .validalarm").css("display", "none");
        console.log("wrong pw");
    }
    else{
        $("#userpassword").removeClass("wronginput");
        $("#pw_inputfield .wrongalarm").css("display", "none");
        $("#pw_inputfield .validalarm").css("display", "block");
        console.log("good pw");
    }

    // Validate user password again
    console.log("validatepassword: ", $("#uservalpassword").val());
    const password_val = $("#uservalpassword").val();
    if (password !== password_val || password_val.length === 0) {
        $("#uservalpassword").addClass("wronginput");
        $("#pwconfirm_inputfield .wrongalarm").css("display", "block");
        $("#pwconfirm_inputfield .validalarm").css("display", "none");
        console.log("wrong id");
    }
    else{
        $("#uservalpassword").removeClass("wronginput");
        $("#pwconfirm_inputfield .wrongalarm").css("display", "none");
        $("#pwconfirm_inputfield .validalarm").css("display", "block");
        console.log("good id");
    }



    // Validate user first name
    console.log("firstname: ", $("#userfirstname").val());
    const userFirstName = $("#userfirstname").val();
    const re_name = /^[A-Z][A-Za-z]*$/;
    if (!re_name.test(userFirstName)) {
        $("#userfirstname").addClass("wronginput");
        $("#firstname_inputfield .wrongalarm").css("display", "block");
        $("#firstname_inputfield .validalarm").css("display", "none");
    }
    else{
        $("#userfirstname").removeClass("wronginput");
        $("#firstname_inputfield .wrongalarm").css("display", "none");
        $("#firstname_inputfield .validalarm").css("display", "block");
    }

    // Validate user Last name
    console.log("lastname: ", $("#userlastname").val());
    const userLastName = $("#userlastname").val();
    if (!re_name.test(userLastName)) {
        $("#userlastname").addClass("wronginput");
        $("#lastname_inputfield .wrongalarm").css("display", "block");
        $("#lastname_inputfield .validalarm").css("display", "none");
    }
    else{
        $("#userlastname").removeClass("wronginput");
        $("#lastname_inputfield .wrongalarm").css("display", "none");
        $("#lastname_inputfield .validalarm").css("display", "block");
    }

    /* how to get values from radio inputs: https://loomio.tistory.com/28 */
    console.log("gubun: ", $('input[name="gubun"]:checked').val());
    const gubun = $('input[name="gubun"]:checked').val();
    if (gubun === undefined) {
        $("#registeras_inputfield .wrongalarm").css("display", "block");
        $("#registeras_inputfield .validalarm").css("display", "none");
    }
    else{
        $("#registeras_inputfield .wrongalarm").css("display", "none");
        $("#registeras_inputfield .validalarm").css("display", "block");
    }
}

$("#id_valid_button").click((e) => {
    e.preventDefault();
    e.stopPropagation();
    if($("#userid").val().trim() === ""){
        alert("Id is empty!");
        return;
    }
    $.ajax({
        url: 'validate/validateID.jsp',
        type: 'post',
        data: { "id" : $("#userid").val() },
        success:function(rs){
            rs = rs.trim();
            console.log(rs);
            if(rs === "true"){
                $("#userid").prop("disabled", true);
                $("#id_valid_button").prop("disabled", true);
            }else{
                alert("ID already exists! Please select other Id.");
            }
        }
    });
});

init();
$("#userid").on("input", validate_inputs);
$("#userpassword").on("input", validate_inputs);
$("#uservalpassword").on("input", validate_inputs);
$("#userfirstname").on("input", validate_inputs);
$("#userlastname").on("input", validate_inputs);
// https://huskdoll.tistory.com/942
$("input[name='gubun']:radio").change(validate_inputs);
