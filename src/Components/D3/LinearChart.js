import * as d3 from 'd3'
/**
 * A simple spider chart
 * @param {array<int>} data - performances of the user
 */
export function linearChart(data) {
    // Create the chart
    let chart = d3.select("#linearChart")
        .attr("width", 350)
        .attr("height", 350)
    // Clean obsolete chart 🗑️
    chart.selectAll("#linearChart .d3").remove()
    // register our line
    let line = d3.line() 
        .x(d => d.x)
        .y(d => d.y)
        .curve(d3.curveBasis)
    //draw our path ✍🏼
    chart.append("svg:path")
    .datum(getPathCoordinates([-15,0,15,30,45,60,75,90,100,115]))
    .attr("d", line)
    .attr("class", "d3")
    .attr("stroke", "white")
    .attr("stroke-width", "3")
    .attr("fill-opacity", "0")
    // launch a transition lineTween with the data 
    .transition()
        .duration(750)
        .call(lineTween, [0, ...data, 99])
    // Register our fantastic transition ✨
    function lineTween(transition, dataPoints) {
        transition.attrTween("d", function (d) {
            let interpolateEnd = d3.interpolate(d, getPathCoordinates(dataPoints))
            return function (t) {
                d = interpolateEnd(t)
                return line(d)
            }
        })
    }
    // Some tools to transform our data into coordinates and path 🛠️
    function getPathCoordinates(dataPoints){
        let coordinates = dataPoints.map((point, index) => (
            {
                x: index * 41 - 21,
                y: 150 - 150 * ( point /100 )
            }
        ))
        return coordinates
    }
}
