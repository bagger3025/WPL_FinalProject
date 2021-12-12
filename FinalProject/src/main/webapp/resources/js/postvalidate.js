function init() {
    $("#submitbutton").click((e) => {
        const postingTitle = $("#postingTitle").val().trim();
        if (postingTitle.length === 0) {
            alert("Please enter title");
            $("#postingTitle").focus();
            e.preventDefault();
            return;
        }
        if (postingTitle.length >= 40){
            alert("Title should be less then 40 letters");
            $("#postingTitle").focus();
            e.preventDefault();
            return;
        }

        const postingContent = $("#postingContent").val().trim();
        if (postingContent.length === 0) {
            alert("Please enter contents");
            $("#postingContent").focus();
            e.preventDefault();
            return;
        }

        const postingMoney = Number($("#postingMoney").val());
        if($("#postingMoney").val().length >= 8){
            alert("You can't set wage more than 9999999");
            $("#postingMoney").focus();
            e.preventDefault();
            return;
        }
        console.log(postingMoney, "   ", 0);
        if (postingMoney <= 0) {
            alert("Please enter valid wage");
            $("#postingMoney").focus();
            e.preventDefault();
            return;
        } else if (Math.floor(postingMoney) !== postingMoney) {
            alert("Wage must be integer");
            $("#postingMoney").focus();
            e.preventDefault();
            return;
        }
    });
}


init();