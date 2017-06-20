$(document).ready(function () {
    $("#newClass").click(function () {
        $("#addClass").slideToggle();
    });
    $("#newLession").click(function () {
        $("#addLession").slideToggle();
    });
    $("#flip").click(function () {
        $("#selectLession").slideToggle();
    });
    $("#new").click(function () {
        $("#newUser").slideToggle();
    });
    $("#newUserClose").click(function () {
        $("#newUser").slideUp();
    });
//    $("#scqClose").click(function () {
//        $("#aSCQ").slideUp();
//    });
//    $("#mcqClose").click(function () {
//        $("#aMCQ").slideUp();
//    });
//    $("#codeqClose").click(function () {
//        $("#aCODEQ").slideUp();
//    });

    $("#addClassClose").click(function () {
        $("#addClass").slideUp();
    });
    $("#addLessionClose").click(function () {
        $("#addLession").slideUp();
    });
});

function ifDel() {
    if (window.confirm("确定删除吗?删除后无法恢复!")) {
        return true;
    }
    return false;
}


function check() {
    var type = document.getElementsByName("user.type");
    var checked = false;
    for (var i = 0; i < type.length; i++) {
        if (type[i].checked) {
            checked = true;
            break;
        }
    }
    if (checked === false) {
        alert("请选择用户类型!");
        return false;
    }
    return true;
}
function changeActive(object, size) {
    for (var i = 0; i <= size; i++) {
        document.getElementById("menu" + i).className = "";
    }
    object.className = "active";
}


function addSCQ(id) {
    $(document).ready(function () {  
        $("#SCQtitle").html("为<strong>试卷" + id + "</strong>添加一道单选题");
        $("#scqId").attr("value", id);
    });
}
function addMCQ(id) {
    $(document).ready(function () {       
        $("#MCQtitle").html("为<strong>试卷" + id + "</strong>添加一道多选题");
        $("#mcqId").attr("value", id);
    });
}
function addCODEQ(id) {
    $(document).ready(function () {
        $("#CODEQtitle").html("为<strong>试卷" + id + "</strong>添加一道简答题");
        $("#codeqId").attr("value", id);
    });
}

function jg() {
    var newPassword = document.getElementById("password").value;
    var qPassword = document.getElementById("password_confirm").value;
    if (newPassword != qPassword)
    {
        alert("两次密码不相同!");
        return false;
    }
    return true;
}
