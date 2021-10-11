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
        .curve(d3.curveMonotoneX)
    //draw our path ✍🏼
    chart.append("svg:path")
        .datum(getPathCoordinates([-15,0,15,30,45,60,75,90,100,115]))
        .attr("d", line)
        .attr("class", "d3")
        .attr("stroke", "white")
        .attr("stroke-width", "3")
        .attr("fill", "none")
    // launch a transition lineTween with the data 
    .transition()
        .duration(750)
        .call(lineTween)
    // Not proud of this, I'll think of a better way
    // add data points and bubbles
    getPathCoordinates([...data]).map((coordinates, index) => {
        let shadowRect = chart.append("svg:rect")
            .attr('x', coordinates.x+41)
            .attr('y', 0)
            .attr('width', "100%")
            .attr('height', 300)
            .attr("class", "d3")
            .attr('opacity', '0');
        // hitbox
        chart.append("svg:rect")
            .attr('x', coordinates.x+21)
            .attr('y', 0)
            .attr('width', 41)
            .attr('height', 300)
            .attr("class", "d3 opacity-0")
            // make it appear on hover + make the infos appears
            .on('mouseover', function () {
                dataCircle.transition()
                    .duration('300')
                    .attr('opacity', '1')
                dataBubble.transition()
                    .attr('opacity', '1')
                dataText.transition()
                    .attr('opacity', '1')
                shadowRect.transition()
                    .attr('opacity', '0.1')
            })
            .on('mouseout', function () {
                dataCircle.transition()
                    .duration('300')
                    .attr('opacity', '0')
                dataBubble.transition()
                    .attr('opacity', '0')
                dataText.transition()
                    .attr('opacity', '0')
                shadowRect.transition()
                    .attr('opacity', '0')
        })
        let dataBubble = chart.append("svg:rect")
            .attr('x', coordinates.x+46)
            .attr('y', coordinates.y-25)
            .attr('width', "50")
            .attr('height', 20)
            .attr("class", "d3 text-white fill-current")
            .attr('opacity', '0')
        let dataText = chart.append("svg:text")
            .attr("x", coordinates.x+71)
            .attr("y", coordinates.y-10)
            .style("text-anchor", "middle")
            .attr("class", "d3 text-xs text-red-600 fill-current")
            .text(data[index] + "min")  
            .attr('opacity', '0')
        let dataCircle = chart.append("svg:circle")
            .attr("class", "d3 text-white fill-current")
            .attr('opacity', '0')
            .attr("cx", coordinates.x+41)
            .attr("cy", coordinates.y)
            .attr("r", 4)   
    })
    // Register our fantastic transition ✨
    function lineTween(transition) {
        transition.attrTween("d", function (d) {
            let interpolateEnd = d3.interpolate(d, getPathCoordinates([0, ...data, 99]))
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
                y: 240 - 240 * ( point /150 )
            }
        ))
        return coordinates
    }
}
