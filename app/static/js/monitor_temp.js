$(document).ready(function() {

// load data 
var data = d3.csv("/static/data/monitor_temp.json")
             .then(data => console.log(data))


// Set the dimensions and margins of the plot
var margin = { top: 10, right: 30, bottom: 30, left: 60 },
  width = 460 - margin.left - margin.right,
  height = 400 - margin.top - margin.bottom;

// Parse the date/time
var parseDate = d3.timeParse("%Y-%m-%d %H:%M:S");

// Set the ranges
var x = d3.scaleTime().range([0, width]);
var y = d3.scaleLinear().range([height, 0]);

// Define the line
var line = d3
  .line()
  .x(function (d) {
    return x(d.Datetime);
  })
  .y(function (d) {
    return y(d.Temperature);
  });

// Append the SVG object to the body of the page
var svg = d3
  .select("#visualization")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// Format the data
data.forEach(function (d) {
  d.date = parseDate(d.Datetime);
  d.value = +d.Temperature;
});

// Scale the range of the data
x.domain(
  d3.extent(data, function (d) {
    return d.date;
  })
);
y.domain([
  0,
  d3.max(data, function (d) {
    return d.value;
  })
]);

// Add the line
svg.append("path")
  .data([data])
  .attr("class", "line")
  .attr("d", line);

// Add the X Axis
svg.append("g")
  .attr("transform", "translate(0," + height + ")")
  .call(d3.axisBottom(x));

// Add the Y Axis
svg.append("g").call(d3.axisLeft(y));

});
