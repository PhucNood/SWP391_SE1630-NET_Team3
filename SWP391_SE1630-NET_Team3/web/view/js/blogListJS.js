/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function setTimeSearch(time) {
    var archives = document.getElementsByClassName("button-archive");
    for (var i = 0; i < archives.length; i++) {
        archives[i].style.color = "#888";
        archives[i].style.backgroundColor = "white";
    }
    document.getElementById(time).style.color = "white";
    document.getElementById(time).style.backgroundColor = "#888";
    if (time) {
        document.getElementById("SearchTime").value = time;
    }
    var temp = document.getElementById("SearchTime").value;
    console.log(temp);
}


