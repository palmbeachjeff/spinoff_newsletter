<div id="container" style="height: 400px; min-width: 600px"></div>  
  
  <script src="http://code.highcharts.com/stock/highstock.js"></script>  
  
    <script src="http://code.highcharts.com/stock/modules/exporting.js"></script>  

      <script type="text/javascript" src="http://www.highcharts.com/samples/data/three-series-1000-points.js"></script>


$(function() {  
    var chart = new Highcharts.StockChart({  
      chart: {  
        renderTo: 'container'  
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
      series: [{  
        name: 'ADBE',  
        data: ADBE  
      }, {  
        name: 'MSFT',  
        data: MSFT  
      }]  
    });  
  });​  