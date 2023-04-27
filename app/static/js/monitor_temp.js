// Define the data
var data = [
  { date: "2022-01-01", value: 10 },
  { date: "2022-01-02", value: 20 },
  { date: "2022-01-03", value: 15 },
  { date: "2022-01-04", value: 25 },
  { date: "2022-01-05", value: 30 }
];

// Set the dimensions and margins of the plot
var margin = { top: 10, right: 30, bottom: 30, left: 60 },
  width = 460 - margin.left - margin.right,
  height = 400 - margin.top - margin.bottom;

// Parse the date/time
var parseDate = d3.timeParse("%Y-%m-%d");

// Set the ranges
var x = d3.scaleTime().range([0, width]);
var y = d3.scaleLinear().range([height, 0]);

// Define the line
var line = d3
  .line()
  .x(function (d) {
    return x(d.date);
  })
  .y(function (d) {
    return y(d.value);
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
  d.date = parseDate(d.date);
  d.value = +d.value;
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

