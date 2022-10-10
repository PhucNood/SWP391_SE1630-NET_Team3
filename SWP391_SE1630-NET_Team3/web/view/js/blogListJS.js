/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function setTimeSearch (time) {
    if(time){
        document.getElementById("SearchTime").value = time;
    }
    var temp = document.getElementById("SearchTime").value;
    console.log(temp);
}


