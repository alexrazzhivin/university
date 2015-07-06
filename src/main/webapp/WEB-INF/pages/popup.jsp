<?xml version="1.0" encoding="utf-8"?>
<html>
<header>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="/components/dhtmlxSuite_v43_pro_eval/codebase/dhtmlx.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <script src="/components/dhtmlxSuite_v43_pro_eval/codebase/dhtmlx.js"></script>
</header>

<body>
<div class="grid_row">
    <div class="grid_container">
        <h1 class="grid_header">Students</h1>

        <%--Grid for students attending the particular course.--%>
        <div id="groups_grid" class="grid">
        </div>
    </div>
</div>
<script>
    gridObject = new dhtmlXGridObject("groups_grid");
    gridObject.setImagePath("/components/dhtmlxSuite_v43_pro_eval/codebase/imgs/");
    gridObject.setHeader("Family Name, Name, Patronymic");
    gridObject.setColTypes("ro,ro,ro");
    gridObject.init();
    gridObject.load("/courseStudentsConnector.do?id={id}".replace("{id}", ${id}), function () {
    });
</script>
</body>
</html>