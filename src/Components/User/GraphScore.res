@module("../D3/RadialBarChart") external radialBarChart: (~score: float) => unit = "radialBarChart"

@react.component
let make = (~id: string) => {

  let userData = ApiHooks.useUserData(id)
  // will fill our SVG with some d3 black magic 🧙🏼‍♂️🪄⚗️✨
  radialBarChart(~score = userData.todayScore)

  <section className="bg-gray-100 rounded-lg py-4 px-6 w-96">
    <h3 className="font-semibold text-lg"> 
      {React.string(`Score`)} 
    </h3>
    <svg id="chart" />
  </section>
}
