import * as d3 from 'd3'
/**
 * A simple double bar chart
 * @param {array<int>} userWeights - Weight during the week of the user
 * @param {array<int>} userCalories - Calories used during the week of the user
 */
export function barChart(userWeights, userCalories) {
    let chart = d3.select("#barChart")
    // register our scales
    let weightScale = d3.scaleLinear()
        .domain([Math.min(...userWeights)*0.8,Math.max(...userWeights)*1.1]).range([189,40])
    let caloryScale = d3.scaleLinear()
        .domain([Math.min(...userCalories)*0.8,Math.max(...userCalories)*1.1]).range([189,40])
    // Create the chart
    let innerChart = d3.select("#barChart").append("svg")
        .attr("width", 810)
        .attr("height", 189)
        .attr("class", "innerSvg overflow-hidden")
    // Clean obsolete chart 🗑️
    chart.selectAll(".innerSvg .d3").remove()
    chart.selectAll("#barChart .d3").remove()
    // register our line
    let line = d3.line() 
        .x(d => d.x)
        .y(d => d.y)
    //draw our path ✍🏼
    userCalories.map((calory, index) => {
        innerChart.append("svg:path")
        .datum([{x:index*110+62, y:195},{x:index*110+62, y:189}])
        .attr("d", line)
        .attr("class", "d3 text-gray-800 stroke-current")
        .attr("stroke-width", "8")
        .attr("stroke-linecap", "round")
        // launch a transition caloryTween with the new coordinates 
        .transition()
            .duration(750)
            .call(caloryTween, calory, index)           
    })
    userWeights.map((weight, index) => {
        innerChart.append("svg:path")
        .datum([{x:index*110+75, y:195},{x:index*110+75, y:189}])
        .attr("d", line)
        .attr("class", "d3 text-red-600 stroke-current")
        .attr("stroke-width", "8")
        .attr("stroke-linecap", "round")
        // launch a transition weightTween with the new coordinates 
        .transition()
            .duration(750)
            .call(weightTween, weight, index)           
    })
    // Register our fantastics transitions ✨
    function caloryTween(transition, calory, index) {
        transition.attrTween("d", function (d) {
            let interpolateEnd = d3.interpolate(d, [{x:index*110+62, y:195}, {x:index*110+62, y:caloryScale(calory)}])
            return function (t) {
                d = interpolateEnd(t)
                return line(d)
            }
        })
    }
    function weightTween(transition, weight, index) {
        transition.attrTween("d", function (d) {
            let interpolateEnd = d3.interpolate(d, [{x:index*110+75, y:195}, {x:index*110+75, y:weightScale(weight)}])
            return function (t) {
                d = interpolateEnd(t)
                return line(d)
            }
        })
    }
    // For the end, let's put some text ✍🏼
    chart.append("svg:text")
        .attr("x", 845)
        .attr("y", 121)
        .style("text-anchor", "middle")
        .attr("class", "d3 text-lg text-gray-400 fill-current")
        .text(Math.round((Math.min(...userWeights)*0.8 + Math.max(...userWeights)*1.1) / 2))
    chart.append("svg:text")
        .attr("x", 845)
        .attr("y", 46)
        .style("text-anchor", "middle")
        .attr("class", "d3 text-lg text-gray-400 fill-current")
        .text(Math.round(Math.max(...userWeights)*1.1))
    chart.append("svg:text")
        .attr("x", 845)
        .attr("y", 196)
        .style("text-anchor", "middle")
        .attr("class", "d3 text-lg text-gray-400 fill-current")
        .text(Math.round(Math.min(...userWeights)*0.8))
}
