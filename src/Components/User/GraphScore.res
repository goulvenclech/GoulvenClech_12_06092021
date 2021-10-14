@module("../D3/RadialBarChart") external radialBarChart: 
  (~radius: int, ~barWidth: int, ~score: float) => unit = "radialBarChart"
/**
 * A chart showing the user score. Filled by D3.js.
 */
@react.component
let make = (~todayScore: float) => {
  // Change the size of the graph
  let radius = 90
  let barWidth = 15
  // will fill our SVG with some D3 black magic 🧙🏼‍♂️🪄⚗️✨
  radialBarChart(~radius = radius, ~barWidth = barWidth, ~score = todayScore)

  <section className="bg-gray-100 rounded-lg py-4 px-6 w-72 h-72">
    <h3 className="font-semibold text-lg"> 
      {React.string(`Score`)} 
    </h3>
    // empty svg used by D3
    <svg id="RadialBarChart" className="h-72">
      // background white circle
      <circle 
        fill="white"
        cx={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.4)} 
        cy={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.25)}
        r={Belt.Int.toString(radius + barWidth / 2)} 
      />
      // some text
      <text 
        x={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.4)}
        y={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.1 +. 25.0)}
        className="text-xl text-center"
        style={ReactDOM.Style.make(~textAnchor="middle", ())}>
        {React.string(`de votre`)} 
      </text>
      <text 
        x={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.4)}
        y={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.1 +. 50.0)}
        className="text-xl text-center"
        style={ReactDOM.Style.make(~textAnchor="middle", ())}>
        {React.string(`objectif`)} 
      </text>
      // loading text, will be deleted by d3
      <text 
        x={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.4)}
        y={Belt.Float.toString(Belt.Int.toFloat(radius) *. 1.1)}
        className="d3 text-xl text-center"
        style={ReactDOM.Style.make(~textAnchor="middle", ())}>
        {React.string(`Chargement`)} 
      </text>
    </svg>
  </section>
}
