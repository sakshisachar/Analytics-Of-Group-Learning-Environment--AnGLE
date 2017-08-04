/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

google.charts.load('current', {packages: ['corechart','bar']});
var mapMin = {};
var mapMax = {};
var mapAvg = {};
var length = 0;
function drawChart() {
    var data = new google.visualization.DataTable();

    data.addColumn("string", "Quiz");
    data.addColumn("number", "Min");
    data.addColumn("number", "Avg");
    data.addColumn("number", "Max");
    data.addRows(length);
    cnt = 0;
    for (x in mapMin) {
        var y1 = mapMin[x];
        var y2 = mapAvg[x];
        var y3 = mapMax[x];
        var z = x.toString();
        data.setCell(cnt, 0, z);
        data.setCell(cnt, 1, y1);
        data.setCell(cnt, 2, y2);
        data.setCell(cnt, 3, y3);
        cnt++;
    }
    var options = {
        chart: {
            title: 'Performance of quiz',
            subtitle: 'Minimum, maximum and average marks of each quiz'
        },

        hAxis: {title: 'Quiz', titleTextStyle: {color: 'black'}},
        colors: ['red', 'blue', 'green'],
        is3D: true,
        
        vAxis: {title: 'Marks', titleTextStyle: {color: 'black'}},
        colors: ['red','blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}