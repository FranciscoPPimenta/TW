/*!
* Start Bootstrap - Shop Homepage v5.0.6 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
function apiCromos(){
    $.ajax({
        url:"https://run.mocky.io/v3/c173c35d-7d43-47a9-a0af-d586d13cb933",
        method: "GET",
        success: function(data){
            console.log(data);
            const pais = data.Country;
            pais.forEach(element => {
                console.log(element.name);
            });
            console.log(pais);
        }
    })
}