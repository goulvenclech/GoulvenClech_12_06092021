import * as d3 from 'd3'
/**
 * A simple radial bar chart
 * @param {int} radius - use for the chart's size  
 * @param {int} barWidth - width of the chart's arc
 * @param {float} score - % of personal goal remaining 
 */
export function radialBarChart(radius, barWidth, score) {
    // Create the chart
    let chart = d3.select("#RadialBarChart")
        .attr("width", radius * 3)
        .attr("height", radius * 3)
    // Clean obsolete chart 🗑️
    chart.selectAll("#RadialBarChart .d3").remove()
    // Register our arc
    let arc = d3.arc()
        .innerRadius(radius)
        .outerRadius(radius + barWidth)
        .cornerRadius(barWidth / 2)
        .startAngle(0)
    // Create a path, and make it an arc with its style & data
	chart.append("svg:path")
        // this is mutable
        .datum({ endAngle: -0.1 })
        .attr("class", "d3")
        .style("fill", "red")
        .attr("transform", "translate(" + radius * 1.4 + "," + radius * 1.25 + ")")
        // use our arc
        .attr("d", arc)
        // launch a transition arcTween with the new endAngle 
        .transition()
            .duration(750)
            .call(arcTween, score * Math.PI * -2)
    // Register our fantastic transition ✨
    function arcTween(transition, newFinishAngle) {
        transition.attrTween("d", function (d) {
            let interpolateEnd = d3.interpolate(d.endAngle, newFinishAngle)
            return function (t) {
            	d.endAngle = interpolateEnd(t)
                return arc(d)
            }
        })
    }
    // For the end, let's put some text ✍🏼
    chart.append("svg:text")
        .attr("x", radius * 1.4)
        .attr("y", radius * 1.1)
        .style("font-size", "2rem")
        .style("text-anchor", "middle")
        .attr("class", "d3")
        .text(score * 100 + "%")
}
