/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* *
 * author Oishi
 * 
 * 
 */



google.charts.load('current', {'packages': ['bar']});
//google.charts.setOnLoadCallback(drawChart);
var map = {};
var length = 0;


/*
 * @author Oishi
 *  it draws google bar graph with given data
 * @returns {undefined}
 */

function drawChart() {
    var data = new google.visualization.DataTable();
    /*
     ['Year', 'Sales', 'Expenses', 'Profit','help'],
     ['2014', 1000, 400, 200,100],
     ['2015', 1170, 460, 250,200],
     ['2016', 660, 1120, 300,500],
     ['2017', 1030, 540, 350,600]
     ]);
     */

    data.addColumn("string", "name");
    data.addColumn("number", "count");

    for (x in map) {

        var y = parseInt(map[x].toString());
        var z = x.toString();
        data.addRow([z, y]);
    }
    // data.addRow(["hhhh",1]);
    //data.addRow(["ghad",2]);
//        var options = {
//                    chart: {
//                        title: ,
//                        subtitle: 'total chats done on each topic during a course',
//                    },
//                    bars: 'horizontal' // Required for Material Bar Charts.
//                    color: 
//                };


    var options = {
        chart: {
            title: 'Note count vs User',
            subtitle: '',
        },

        hAxis: {title: 'User', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}