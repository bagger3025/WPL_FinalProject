function init() {
    $("#contactusbutton").click((e) => {
        const title = $("#postingTitle").val().trim();
        if (title.length === 0) {
            e.preventDefault();
            alert("Please write title!");
            return;
        }
        if (title.length >= 40) {
            e.preventDefault();
            alert("title should be less than 40 letters!");
            return;
        }

        const contents = $("#postingContent").val().trim();
        if (contents.length === 0) {
            e.preventDefault();
            alert("Please write message!");
            return;
        }

        alert("Successfully send the message!");
    });
}

init();