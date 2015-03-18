

    $(function(){

        var sym = $.url().param('symbol') || 'AAPL';
        var dur = $.url().param('duration') || 3650;
        
        new Markit.InteractiveChartApi(sym, dur);
    });

