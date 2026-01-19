/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var mychart;
var mychart2;
$(document).ready(function () {
        jour = new Date();
        mois = jour.getMonth() + 1;
        annee = jour.getFullYear();
        $('#moisrecherche option[value='+mois+']').attr('selected','selected');
        $('#anneerecherche option[value='+annee+']').attr('selected','selected');
        
        initpage();
});
$("#typeartrecherche").change(function(){
    initpage();
});
$("#moisrecherche").change(function(){
    initpage();
});
$("#anneerecherche").change(function(){
    initpage();
});

var initpage = function(){
    if(mychart) mychart.destroy();
    if(mychart2) mychart.destroy();
    
    var typearticle = $("#typeartrecherche").val();
    var mois = $("#moisrecherche").val();
    var annee = $("#anneerecherche").val();
    
    dessinerStockArt(typearticle);
    dessinerQteSortieArt(typearticle,mois,annee);
};
var dessinerStockArt = function(typearticle){
        var jsondata = loadDataStock();
        var ArticleListArray =[];
        var QteStockListArray =[];
        var IdTypeListArray =[];
        
        var typeArticleSelectionne = typearticle; // mbola asiana code via servlet
        for (var key in jsondata) { 
            if(jsondata[key][2] == typeArticleSelectionne){
                ArticleListArray.push(jsondata[key][0]);
                QteStockListArray.push(jsondata[key][1]);
                IdTypeListArray.push(jsondata[key][2]) ;
            }
        }
       
        
        StockArt(ArticleListArray,QteStockListArray);
    
};
var dessinerQteSortieArt = function(typearticle,mois,annee){
        var jsondata = loadDataSortie();
        var ArticleListArray =[];
        var QteSortieListArray =[];
        var IdTypeListArray =[];
        
        var typeArticleSelectionne = typearticle; // mbola asiana code via servlet
        for (var key in jsondata) { 
            if(jsondata[key][2] == typeArticleSelectionne && jsondata[key][3] == mois && jsondata[key][4] == annee){
                ArticleListArray.push(jsondata[key][0]);
                QteSortieListArray.push(jsondata[key][1]);
                IdTypeListArray.push(jsondata[key][2]) ;
            }
        }
       
        
        SortiArt(ArticleListArray,QteSortieListArray);
    
};
var StockArt = function(xValues,yValues){
    
    //const xValues = [50,60,70,80,90,100,110,120,130,140,150];
    //const yValues = [7,8,8,9,9,9,10,11,14,14,15];
       
    mychart =   new Chart("myChart", {
                type: "line",
                data: {
                  labels: xValues,
                  datasets: [{
                    backgroundColor: "rgba(151, 223, 198)",//"rgba(135, 233, 144)", //
                    borderColor: "rgba(34, 120, 15)",
                    data: yValues
                  }]
                },
                options: {
                  legend: {display: false},
                  title: {
                              display: true,
                              text: 'Quantite des articles en stock'

                          },
              //            scales: {
              //              xAxes: [{ticks: {min: 40, max:160}}],
              //              yAxes: [{ticks: {min: 6, max:16}}],
              //            }
                    }
              });
};

var SortiArt = function(xValues,yValues){
    
//    var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
//    var yValues = [55, 49, 44, 24, 15];
    
    var barColors = "rgba(119, 181, 254)";
    
    mychart2 = new Chart("myChart2", {
                    type: "bar",
                    data: {
                      labels: xValues,
                      datasets: [{
                        backgroundColor: "rgba(119, 181, 254)",
                        barPercentage: 0.5,
                        barThickness: 15,
                        maxBarThickness: 15,
                        minBarLength: 10,
                        responsive:true,
                        data: yValues
                      }]
                    },
                    options: {
                          legend: {display: false},
                          title: {
                                      display: true,
                                      text: 'Quantite des articles sortis par mois'

                                  },
              //            scales: {
              //              xAxes: [{ticks: {min: 40, max:160}}],
              //              yAxes: [{ticks: {min: 6, max:16}}],
              //            }
                    }
                  });
};

var loadDataStock = function(){
   
   var formattedstockListArray =[];
    
    $.ajax({
      
      async: false,
       
      url: "StockDataJsonServlet",
       
      dataType:"json",
       
      success: function(stockJsonData) {
  
        //console.log(stockJsonData);

        $.each(stockJsonData,function(index,aStock){

          formattedstockListArray.push([aStock.designation,aStock.stockfinal,aStock.idtypeart]);
        });
      }
    });
   return formattedstockListArray;
  };
  
var loadDataSortie = function(){
   
   var formattedQtesortieListArray =[];
    
    $.ajax({
      
      async: false,
       
      url: "QteSortieDataJsonServlet",
       
      dataType:"json",
       
      success: function(sortieJsonData) {
  
        //console.log(stockJsonData);

        $.each(sortieJsonData,function(index,aSortie){

          formattedQtesortieListArray.push([aSortie.designation,aSortie.qtesortie,aSortie.idtypeart,aSortie.month,aSortie.years]);
        });
      }
    });
   return formattedQtesortieListArray;
  };
  
