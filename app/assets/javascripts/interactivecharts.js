

    $(function(){

        var sym = $.url().param('symbol') || 'MSFT';
        var dur = $.url().param('duration') || 3650;
        
        new Markit.InteractiveChartApi(sym, dur);
    });

