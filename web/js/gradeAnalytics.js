/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* *
 * author manushi
 * 
 * 
 */


google.charts.load('current', {'packages': ['bar']});
//google.charts.setOnLoadCallback(drawChart);
var map = {};
var length = 0;
var map1 = {};
var length1 = 0;

/*
 * it draws google bar graph with given data
 * 
 * @returns {undefined}
 */
function drawChart() {
    
    var data = new google.visualization.DataTable();

    data.addColumn("string", "Name");
    data.addColumn("number", "Maximum Grade");
    data.addColumn("number","Minimum Grade");
    data.addColumn("number","Average Grade");
    for (x in map) {
        var y = map[x].toString().split(":");
        var count1 = parseInt(y[0]);
        var count2 = parseInt(y[1]);
        var count3 = parseFloat(y[2]);
        

        var z = x.toString();
        //alert(y);
        //alert(z);
        data.addRow([z,count1,count2,count3]);
    }
    var options = {
        chart: {
            title: 'Assignment vs grades',
            subtitle: 'Maximum,Minimum and Average Grades obtained per each Assignment',
        },

        hAxis: {title: 'Assignment', titleTextStyle: {color: 'black'}},
        colors: ['blue','red', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}

function drawChart1() {
    var data = new google.visualization.DataTable();

    data.addColumn("string", "Topic");
    data.addColumn("number", "Average Grade");

    for (x in map1) {
        var y = parseInt(map1[x].toString());
        var z = x.toString();
        data.addRow([z, y]);
    }
    var options = {
        chart: {
            title: 'Topic vs grades',
            subtitle: 'Average Grades obtained per each Topic',
        },
        hAxis: {title: 'Assignment', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'red', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material1'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}