$("#suppliers").DataTable({
    "paging":true,
    language:{
        url: "/dataTable_portuguese.json"
    },
    "initComplete": function(){
        //  var rowToolbar = $("#suppliers_wrapper").children('.row:first-child').css({
        //     "position": "relative",
        //     "text-align": "center",
        //     "margin-top": "-45px",
        //     "justify-content": "end",
        //     "width": "100%",
        //     "color": "white"
        // });
        // var quantityofItens = rowToolbar.children('div')[0];
        // var searchField = rowToolbar.children('div')[1];
        // searchField.style.marginLeft = "auto";
        // searchField.style.marginRight = "5%";
        // searchField.style.width = "20%";
        // quantityofItens.style.marginLeft = "50%";
        // quantityofItens.style.width = "20%";
        
    },
    "columnDefs": [{
        "type": "html-num", "targets":0
    }]
});