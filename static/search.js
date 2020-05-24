window.onload = initialize;

function initialize() {
    document.getElementById("modify-button").addEventListener("click", showFormAndHideTable);
    document.getElementById("cancel-modify").addEventListener("click", showTableAndHideForm);
}

function showFormAndHideTable(){
    document.getElementById("table-search").style.display = "none";
    document.getElementById("form-modify").style.display = "block";
}

function showTableAndHideForm(){
    document.getElementById("table-search").style.display = "table";
    document.getElementById("form-modify").style.display = "none";
}




