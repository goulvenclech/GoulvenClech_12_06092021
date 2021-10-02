@module("../D3/RadialBarChart") external radialBarChart: 
  (~radius: int, ~barWidth: int, ~score: float) => unit = "radialBarChart"

@react.component
let make = (~id: string) => {
  // Change the size of the graph
  let radius = 90
  let barWidth = 15
  // fetch our back end
  let userData = ApiHooks.useUserData(id)
  // will fill our SVG with some d3 black magic 🧙🏼‍♂️🪄⚗️✨
  radialBarChart(~radius = radius, ~barWidth = barWidth, ~score = userData.todayScore)

  <section className="bg-gray-100 rounded-lg py-4 px-6 w-72 h-72">
    <h3 className="font-semibold text-lg"> 
      {React.string(`Score`)} 
    </h3>
    // empty svg used by d3
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
