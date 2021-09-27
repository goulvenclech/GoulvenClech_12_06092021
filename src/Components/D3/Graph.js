import * as d3 from 'd3';

export function test(score) {
    const radius = 110
    const barWidth = 20
    var chart = d3.select("#chart")
        .attr("width", radius * 3)
        .attr("height", radius * 3)
        ;
   
    chart.append("svg:circle")
        .attr('cx', radius * 1.5)
        .attr('cy', radius * 1.5)
        .attr('r', radius + barWidth / 2)
        .attr('fill', 'white');
        ;

    const radialScale = d3.scaleLinear()
        .domain([0, 1])
        .range([0, -2 * Math.PI]);

	var bar = chart.append("svg:path")
        .attr("class", "chart1")
        .attr("transform", "translate(" + radius * 1.5 + "," + radius * 1.5 + ")")
        .style("fill", "red")
        .attr("d", d3.arc()
            .innerRadius(radius)
            .outerRadius(radius + barWidth)
            .startAngle(0)
            .cornerRadius(barWidth / 2)
            .endAngle(radialScale(0))    
        )
    ;
        
    bar.transition().duration(3000).delay(0)
        .attr("d", d3.arc() 
            .innerRadius(radius)
            .outerRadius(radius + barWidth)
            .startAngle(0)
            .cornerRadius(barWidth / 2)
            .endAngle(radialScale(score))
        )
    ;

    chart.append("svg:text")
        .attr("x", radius * 1.5)
        .attr("y", radius * 1.4)
        .style("font-size", "2rem")
        .style("text-anchor", "middle")
        .text(score * 100 + "%")
        ;

    chart.append("svg:text")
        .attr("x", radius * 1.5)
        .attr("y", radius * 1.4 + 25)
        .style("font-size", "1.2rem")
        .style("text-anchor", "middle")
        .text("de votre")
        ;

    chart.append("svg:text")
        .attr("x", radius * 1.5)
        .attr("y", radius * 1.4 + 50)
        .style("font-size", "1.2rem")
        .style("text-anchor", "middle")
        .text("objectif")
        ;
    

}
