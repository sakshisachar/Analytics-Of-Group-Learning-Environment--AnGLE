/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* *
 * author manushi
 * analytics for submission(s) per each assignment
 * 
 */


google.charts.load('current', {'packages': ['bar']});
//google.charts.setOnLoadCallback(drawChart);
var map = {};
var length = 0;

/*
 * it draws google bar graph with given data
 * 
 * @returns {undefined}
 */
function drawChart() {
    
    var data = new google.visualization.DataTable();
    data.addColumn("string", "Name");
    data.addColumn("number", "submission(s)");
    arr = Object.keys(map);
    for (var i = 0 ; i < arr.length ;i++) {
      //  alert(map[arr[i]]);
        var y = parseInt(map[arr[i]].toString());
        var z = arr[i].toString();
        data.addRow([z, y]);
    }
    var options = {
        chart: {
            title: 'Assignment vs submission(s)',
            subtitle: '',
        },

        hAxis: {title: 'Assignment', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}