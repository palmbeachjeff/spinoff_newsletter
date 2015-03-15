$.getJSON("/analytics/chart/monthly_data?site_id=12345", function(data) {  
   var chart = new Highcharts.StockChart({  
     chart: {  
       renderTo: 'container'  
     },          
     series: [{  
       type: 'line',   
       name: 'MSFT',  
       data: data  
     }]  
   });  
 });     

tooltip: {  
       shared: true,  
       formatter: function(){  
        var p = '';  
        var actual = '';  
        var predicted = 0;  
        p += '<b>'+ this.x +'</b><br/>';  
        $.each(this.points, function(i, series){  
         if(this.series.name == Decrease' && this.y > 0){  
          p += '<span style="font-weight:bold;color:'+ this.series.color +'">' + this.series.name + ':</span>';  
         }  
         if(this.series.name == Increase' && this.y < 0){  
          p += '<span style="font-weight:bold;color:'+ this.series.color +'">' + this.series.name + ':</span>';  
         }  
         if(this.series.name == 'Actual'){  
          p += '<span style="font-weight:bold;color:'+ this.series.color +'">' + this.series.name + ':</span>';  
          p += '<b>' + Highcharts.numberFormat(actual, 0) + ' kWh</b><br/>';  
         }  
         if(this.series.name == 'Predicted'){  
          p += '<span style="font-weight:bold;color:'+ this.series.color +'">' + this.series.name + ':</span>';         p += '<b>' + Highcharts.numberFormat(predicted, 0) + ' kWh</b><br/>';  
         }  
        });        
        return p;  
       }  
      }  
$(function() {  
   var chart = new Highcharts.Chart({  
     chart: {  
       renderTo: 'container',  
       defaultSeriesType: 'area'  
     },  
     legend: {  
       enabled: true,  
       align: 'right',  
       backgroundColor: '#FCFFC5',  
       borderColor: 'black',  
       borderWidth: 2,  
       layout: 'vertical',  
       verticalAlign: 'top',  
       y: 100,  
       shadow: true  
     },  
     rangeSelector: {  
       selected: 1  
     },  
     series: []  
   });  
   $("#container").queue("chartQueue",  
     function(next) {  
       chart.showLoading("ADBE");  
       chart.addSeries(  
       {  
         name: 'ADBE',  
         marker: {  
           enabled: false  
         },  
         data: ADBE  
       });  
       setTimeout(function() {  
         chart.hideLoading();  
       }, 3000);  
       next();  
     });  
   $("#container").delay(3000, "chartQueue");  
   $("#container").queue("chartQueue",  
     function(next) {  
       chart.showLoading("MSFT");  
       chart.addSeries(  
       {  
         name: 'MSFT',  
         marker: {  
           enabled: false  
         },  
         data: MSFT  
       });  
       setTimeout(function() {  
         chart.hideLoading();  
       }, 3000);  
       next();  
     });  
   $("#container").delay(3000, "chartQueue");  
   $("#container").dequeue("chartQueue");  
 });​  