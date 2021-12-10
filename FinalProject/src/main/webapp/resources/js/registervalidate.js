function init() {
    $("#userid").click(() => {
        console.log("userid was clicked!");
    });
    $(".signin_submit").click((e) => {
        let validated = true;
        // Validate user id
        console.log("userid: ", $("#userid").val());
        const userid = $("#userid").val();
        if (userid.length === 0) {
            e.preventDefault();
            e.stopPropagation();
            validated = false;
        }

        // Validate user password
        console.log("password: ", $("#userpassword").val());
        const password = $("#userpassword").val();

        // Validate user password again
        console.log("validatepassword: ", $("#uservalpassword").val());
        const password_val = $("#uservalpassword").val();
        if (password !== password_val) {
            e.preventDefault();
            e.stopPropagation();
            validated = false;
        }

        // Validate user first name
        console.log("firstname: ", $("#userfirstname").val());
        const userFirstName = $("#userfirstname").val();
        const re_name = /^[A-Z][A-Za-z]*$/;
        if (!re_name.test(userFirstName)) {
            e.preventDefault();
            e.stopPropagation();
            validated = false;
        }

        // Validate user Last name
        console.log("lastname: ", $("#userlastname").val());
        const userLastName = $("#userlastname").val();
        if (!re_name.test(userLastName)) {
            e.preventDefault();
            e.stopPropagation();
            validated = false;
        }

        /* how to get values from radio inputs: https://loomio.tistory.com/28 */
        console.log("gubun: ", $('input[name="gubun"]:checked').val());
        const gubun = $('input[name="gubun"]:checked').val();
        if (gubun === undefined) {
            e.preventDefault();
            e.stopPropagation();
            validated = false;
        }

        if (validated) {
            console.log("SUCCESSED");
        } else {
            console.log("FAILED");
        }
    });
    console.log("HELLO!!");
}

init();