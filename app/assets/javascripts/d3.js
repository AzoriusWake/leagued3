function tutorial3() {

var canvas = d3.select("body")
            .append("svg")
            .attr("width", 500)
            .attr("height", 500);

var circle = canvas.append("circle")
            .attr("cx", 250)
            .attr("cy", 250)
            .attr("r", 50)
            .attr("fill", "red");

var rect = canvas.append("rect")
            .attr("width", 100)
            .attr("height", 50);

var line = canvas.append("line")
            .attr("x1", 0)
            .attr("y1", 100)
            .attr("x2", 400)
            .attr("y2", 400)
            .attr("stroke", "green")
            .attr("stroke-width", 10)

}

function tutorial4(){

var dataArray = [20, 40, 50];

var canvas = d3.select("body")
            .append("svg")
            .attr("width", 500)
            .attr("height", 500);

var bars = canvas.selectAll("rect")
          .data(dataArray)
          .enter()
            .append("rect")
            .attr("width", function(d){
              return d * 10;
            })
            .attr("height", 50)
            .attr("y", function(d,i){
              return i * 100;
            });

}

function tutorial5(){

var dataArray = [5, 40, 50, 60];
var width = 500;
var height = 500;

var widthScale = d3.scale.linear()
                .domain([0, 60])
                .range([0, width]);

var color = d3.scale.linear()
            .domain([0, 60])
            .range(["red", "blue"]);

var canvas = d3.select("body")
            .append("svg")
            .attr("width", width)
            .attr("height", height);

var bars = canvas.selectAll("rect")
          .data(dataArray)
          .enter()
            .append("rect")
            .attr("width", function(d){
              return widthScale(d);
            })
            .attr("height", 50)
            .attr("fill", function(d){
              return color(d);
            })
            .attr("y", function(d, i){
              return i * 100;
            });

}

function tutorial6(){

var dataArray = [5, 40, 50, 60];
var width = 500;
var height = 500;

var widthScale = d3.scale.linear()
                .domain([0, 60])
                .range([0, width]);

var color = d3.scale.linear()
            .domain([0, 60])
            .range(["red", "blue"]);

var axis = d3.svg.axis()
            .ticks(5)
            .scale(widthScale);

var canvas = d3.select("body")
            .append("svg")
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(20,0)")

var bars = canvas.selectAll("rect")
          .data(dataArray)
          .enter()
            .append("rect")
            .attr("width", function(d){
              return widthScale(d);
            })
            .attr("height", 50)
            .attr("fill", function(d){
              return color(d);
            })
            .attr("y", function(d, i){
              return i * 100;
            });

canvas.append("g")
      .attr("transform", "translate(0,400)")
      .call(axis);

}

function tutorial7(){

// DOM elements < data elements (enter)
// DOM elements > data elements (exit)
// DOM elements = data elements (update)

var data = [10]; // data elements

var canvas = d3.select("body")
            .append("svg")
            .attr("width", 500)
            .attr("height", 500)

var circle1 = canvas.append("circle") // dom element
            .attr("cx", 50)
            .attr("cy", 100)
            .attr("r", 25);

var circle2 = canvas.append("circle") //dom element
            .attr("cx", 50)
            .attr("cy", 200)
            .attr("r", 25);

var circle = canvas.selectAll("circle")
            .data(data)
            .attr("fill", "green")
            .exit()
              .attr("fill", "blue");
            // .attr("fill", "red")
            // .enter()
            //   .append("circle")
            //   .attr("cx", 50)
            //   .attr("cy", 50)
            //   .attr("fill", "green")
            //   .attr("r", 25);

}

function tutorial8(){

var canvas = d3.select("body")
            .append("svg")
            .attr("width", 500)
            .attr("height", 500);

var circle = canvas.append("circle")
            .attr("cx", 50)
            .attr("cy", 50)
            .attr("r", 25);

circle.transition()
  .duration(1500)
  .delay(1000)
  .attr("cx", 250)
  .attr("cy", 150)

  .each("end", function(){
    d3.select(this).attr("fill", "red")
  }) // end = end of transition
  .each("start", function(){
    d3.select(this).attr("fill", "blue")
  }) // start = start of transition
  // .transition()
  // .attr("cy", 25)
  // .transition()
  // .attr("cx", 50)

}

function tutorial9(){

var data = [10, 20, 30, 40, 100];

console.log(data);
console.log(data.sort());
console.log(data.sort(d3.descending));
console.log(d3.min(data));
console.log(d3.max(data));
console.log(d3.extent(data));
console.log(d3.sum(data));
console.log(d3.mean(data));
console.log(d3.median(data));
console.log(d3.shuffle(data));

}

function tutorial10(){
// did not work
// d3.csv("mydata.csv", function(data)){
d3.json("mydata.json", function(data){

  var canvas = d3.select("body").append("svg")
              .attr("width", 500)
              .attr("height", 500)

  canvas.selectAll("rect")
        .data(data)
        .enter()
          .append("rect")
          .attr("width", function(d){
            return d.age * 10;
          })
          .attr("height", 48)
          .attr("y", function(d, i){
            return i * 50;
          })
          .attr("fill", "blue");

  canvas.selectAll("text")
        .data(data)
        enter()
          .append("text")
          .attr("fill", "white")
          .attr("y", function(d, i){
            return i * 50 + 24;
          })
          .text(function(d){
            return d.name;
          })
})

}

function tutorial11(){

var canvas = d3.select("body").append("svg")
            .attr("width", 500)
            .attr("height", 500);

var data = [
      {x: 10, y:20},
      {x: 40, y:60},
      {x: 50, y:70}
];

var group = canvas.append("g")
            .attr("transform", "translate(100,100)");

var line = d3.svg.line()
            .x(function(d){ return d.x; })
            .y(function(d){ return d.y; })

group.selectAll("path")
    .data([data])
    .enter()
    .append("path")
    .attr("d", line)
    .attr("fill", "none")
    .attr("stroke", "black")
    .attr("stroke-width", 10);

}

function tutorial12(){

var canvas = d3.select("body").append("svg")
            .attr("width", 500)
            .attr("height", 500);

var group = canvas.append("g")
            .attr("transform", "translate(100,100)");

var r = 100;
var p = Math.PI * 2;

var arc = d3.svg.arc()
            .innerRadius(r - 20)
            .outerRadius(r)
            .startAngle(0)
            .endAngle(p - 2);

group.append("path")
    .attr("d", arc);
}

function tutorial13(){

var data = [10,50,80];
var r = 300;

var color = d3.scale.ordinal()
              .range(["red", "blue", "orange"])

var canvas = d3.select("body").append("svg")
              .attr("width", 1500)
              .attr("height", 1500)

var group = canvas.append("g")
                  .attr("transform", "translate(300,300)");

var arc = d3.svg.arc()
            .innerRadius(0) // for donut, increase this number
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