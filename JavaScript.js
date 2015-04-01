function pageLoad() {
    $(document).ready(function () {

        document.getElementById("TextArea1").value = localStorage.getItem("stickytext");

        $(".dashboard").draggable();
        $('#insidediv').draggable();
        $("#themelist").bind("change", function () {
            switch ($("#themelist").val()) {
                case "Blue":
                    $(".dashboard").removeClass("dashboard").addClass("dashboardblue");
                    $(".dashboardazure").removeClass("dashboardazure").addClass("dashboardblue");
                    break;

                case "Azure":
                    $(".dashboardblue").removeClass("dashboardblue").addClass("dashboardazure");
                    $(".dashboard").removeClass("dashboard").addClass("dashboardazure");
                    break;

                case "Coral":
                    $(".dashboardblue").removeClass("dashboardblue").addClass("dashboard");
                    $(".dashboardazure").removeClass("dashboardazure").addClass("dashboard");
            }
        });
    });
};

function pageunload() {
    localStorage.setItem("stickytext", document.getElementById("TextArea1").value);
}