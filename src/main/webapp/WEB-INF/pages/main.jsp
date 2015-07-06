<?xml version="1.0" encoding="utf-8"?>
<html>
<header>
    <link rel="stylesheet" type="text/css" href="/components/dhtmlxSuite_v43_pro_eval/codebase/dhtmlx.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <script src="/components/dhtmlxSuite_v43_pro_eval/codebase/dhtmlx.js"></script>
</header>

<body>
<div class="grid_container">
    <h1 class="grid_header">Groups/Students</h1>

    <%--Grid for groups and its students.--%>
    <div id="groups_grid" class="grid">
    </div>
</div>
<div class="grid_container">
    <h1 class="grid_header">Subjects/Courses</h1>

    <%--Tree grid for subjects and its courses.--%>
    <div id="subjects_grid" class="grid">
    </div>
</div>
<script>
    //            Initializing groups grid.
    gridObject = new dhtmlXGridObject("groups_grid");
    gridObject.setImagePath("/components/dhtmlxSuite_v43_pro_eval/codebase/imgs/");
    gridObject.setHeader("&nbsp;,Group Name, Students Number");
    gridObject.setInitWidths("30,*,*");
    gridObject.setColTypes("sub_row_grid,ro,ro");
    gridObject.init();

    //            Initializing subgrid for students.
    gridObject.attachEvent("onSubGridCreated", function (subgrid, rowId, rowIndex) {
        subgrid.setHeader("Family Name, Name, Patronymic");
        subgrid.setColTypes("ed,ed,ed");
        subgrid.init();

//                Loading students for group when subgrid created.
        var url = "/studentsConnector.do?id={id}".replace("{id}", rowId);
        subgrid.load(url, function () {
            subgrid.callEvent("onGridReconstructed", []);
            gridObject.callEvent("onGridReconstructed", []);
        });

//                Creating data processor in order to modify students information.
        dp = new dataProcessor(url);
        dp.init(subgrid);

        return false;
    });

    //            Loading groups.
    gridObject.load("/groupsConnector.do", function () {
        var count = gridObject.getRowsNum();
        var maxStudentsRowId = -1;
        var maxValue = -1;

//                Looking for row that contains the maximum number of students (red).
//                Looking for each 3rd row (green).
        for (var i = 0; i < count; ++i) {
            var rowId = gridObject.getRowId(i);
            var value = gridObject.cellById(rowId, 2).getValue();
            if (maxValue < value) {
                maxStudentsRowId = rowId;
                maxValue = value;
            }
            if ((i + 1) % 3 == 0) {
                gridObject.setRowColor(rowId, "green");
            }
        }

        gridObject.setRowColor(maxStudentsRowId, "red");
    });
</script>
<script>
    //            Initializing subjects tree grid.
    treeGrid = new dhtmlXGridObject("subjects_grid");
    treeGrid.setImagePath("/components/dhtmlxSuite_v43_pro_eval/codebase/imgs/");
    treeGrid.setHeader("Subject,&nbsp;");
    treeGrid.setInitWidths("*,30");
    treeGrid.setColTypes("tree,sub_row_grid");
    treeGrid.init();

    //            Initializing subgrid for courses.
    treeGrid.attachEvent("onSubGridCreated", function (subgrid, rowId, rowIndex) {
        subgrid.setHeader("Course Name");
        subgrid.setColTypes("ro");
        subgrid.init();

//                Loading courses for subject.
        var url = "/coursesConnector.do?id={id}".replace("{id}", rowId);
        subgrid.attachEvent("onRowSelect", function (id, ind) {
            var win = window.open("/popup?id={id}".replace("{id}", id), '_blank');
            win.focus();
        });
        subgrid.load(url, function () {
        });

        return false;
    });

    //            Loading subjects.
    treeGrid.load("/subjectsConnector.do", function () {
    });
</script>
</body>
</html>