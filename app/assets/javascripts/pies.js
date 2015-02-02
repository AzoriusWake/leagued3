function fetchPie(url){
  $.get(url)
  .done(function(response){
    var data = response.pie_data;
    var labels = response.pie_labels;
    pieChart(response.pie_data);
  });
}

function pieChart(data){
  var data = data;
  var r = 300;
  var color = d3.scale.ordinal()
                .range(["#cd7f32", "#cccccc", "#ffd700", "#e5e4e2", "#4169e1", "#4169e1", "#4169e1"]);
  var canvas = d3.select("body").append("svg")
                .attr("width", 1500)
                .attr("height", 1500);
  var group = canvas.append("g")
                    .attr("transform", "translate(300,300)");
  var arc = d3.svg.arc()
              .innerRadius(0)
              .outerRadius(r);
  var pie = d3.layout.pie()
              .value(function(d){
                return d;
              });
  var arcs = group.selectAll(".arc")
                  .data(pie(data))
                  .enter()
                  .append("g")
                  .attr("class", "arc");
  arcs.append("path")
      .attr("d", arc)
      .attr("fill", function(d){
        return color(d.data);
      });
  arcs.append("text")
      .attr("transform", function(d){
        return "translate(" + arc.centroid(d) + ")";
      })
      .attr("text-anchor", "middle")
      .attr("font-size", "1.5em")
      .text(function(d){
        return d.data;
      });
}