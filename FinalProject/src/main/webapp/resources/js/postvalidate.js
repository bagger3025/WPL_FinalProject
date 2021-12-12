function init() {
    $("#submitbutton").click((e) => {
        const postingTitle = $("#postingTitle").val();
        if (postingTitle.length === 0) {
            alert("Please enter title");
            $("postingTitle").focus();
            e.preventDefault();
            return;
        }

        const postingContent = $("#postingContent").val();
        if (postingContent.length === 0) {
            alert("Please enter contents");
            $("postingContent").focus();
            e.preventDefault();
            return;
        }

        const postingMoney = Number($("#postingMoney").val());
        console.log(postingMoney, "   ", 0);
        if (postingMoney <= 0) {
            alert("Please enter valid wage");
            $("postingMoney").focus();
            e.preventDefault();
            return;
        } else if (Math.floor(postingMoney) !== postingMoney) {
            alert("Wage must be integer");
            $("postingMoney").focus();
            e.preventDefault();
            return;
        }
    });
}

init();
console.log("WHy nunu WHy?");