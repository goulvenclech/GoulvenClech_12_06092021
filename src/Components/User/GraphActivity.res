// @module("../D3/SpiderChart") external spiderChart: (~data: array<int>) => unit = "spiderChart"

@react.component
let make = (~id: string) => {
  // fetch our back end
  let apiResult = ApiHooks.useUserPerformance(id)
  let userPerformances = Belt.Array.map(apiResult.data, perf => {perf.value})
  // will fill our SVG with some d3 black magic 🧙🏼‍♂️🪄⚗️✨
  // spiderChart(~data = userPerformances)

  <section className="bg-gray-100 rounded-lg p-4 w-full h-72">
    <h3 className="w-3/4 font-semibold text-lg"> 
      {React.string(`Activité quotidienne`)} 
    </h3>
    // empty svg used by d3
    <svg id="SessionsChart" className="h-72 block">
      // background white hexagons
      // Some text
    </svg>
  </section>
}
