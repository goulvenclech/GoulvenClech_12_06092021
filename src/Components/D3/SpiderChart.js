import * as d3 from 'd3'
/**
 * A simple spider chart
 * @param {array<int>} data - performances of the user
 */
export function spiderChart(data) {
    // Create the scales for rank our data
    let radialScale = d3.scaleLinear().domain([0,250]).range([0,105])
    // Create the chart
    let svg = d3.select("#SpiderChart")
        .attr("width", 350)
        .attr("height", 350)
    // Clean obsolete chart 🗑️
    svg.selectAll("#SpiderChart .d3").remove()
    //draw our data ✍🏼
    svg.append("path")
    .datum(getPathCoordinates(data))
    .attr("d",d3.line()
        .x(d => d.x)
        .y(d => d.y))
    .attr("class", "d3")
    .attr("fill", "red")
    .attr("fill-opacity", 0.66)
    // Some tools to transform our data into coordinates and path 🛠️
    function getPathCoordinates(dataPoints){
        let coordinates = dataPoints.map((point, index) => angleToCoordinate((Math.PI / 2) + (2 * Math.PI * index / dataPoints.length), point))
        return coordinates
    }
    function angleToCoordinate(angle, value){
        let x = Math.cos(angle) * radialScale(value)
        let y = Math.sin(angle) * radialScale(value)
        return {"x": 140 + x, "y": 130 - y}
    }
}
