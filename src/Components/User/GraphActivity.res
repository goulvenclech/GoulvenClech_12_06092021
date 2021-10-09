 @module("../D3/BarChart") external barChart: (~userWeights: array<int>, ~userCalories: array<int>) => unit = "barChart"

@react.component
let make = (~id: string) => {
  // fetch our back end
  let apiResult = ApiHooks.useUserActivity(id)
  let userWeights = Belt.Array.map(apiResult.sessions, session => {session.kilogram})
  let userCalories = Belt.Array.map(apiResult.sessions, session => {session.calories})
  // will fill our SVG with some d3 black magic 🧙🏼‍♂️🪄⚗️✨
  barChart(~userWeights = userWeights, ~userCalories = userCalories)

  <section className="bg-gray-100 rounded-lg mx-4 w-224 h-72">
    <h3 className="w-3/4 font-semibold text-lg"> 
      {React.string(`Activité quotidienne`)} 
    </h3>
    // empty svg used by d3
    <svg id="barChart" className="h-72 w-full block">
      // background lines
      <path d="M0,190L810,190" className="text-gray-400 stroke-current" strokeWidth="1" />
      <path d="M0,115L810,115" className="text-gray-400 stroke-current stroke-1" strokeDasharray="4" />
      <path d="M0,40L810,40" className="text-gray-400 stroke-current stroke-1" strokeDasharray="4" />
      // Some text for every day in a week
      <text x="70" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`1`)} 
      </text>
      <text x="180" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`2`)} 
      </text>
      <text x="290" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`3`)} 
      </text>
      <text x="400" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`4`)} 
      </text>
      <text x="510" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`5`)} 
      </text>
      <text x="620" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`6`)} 
      </text>
      <text x="730" y="220" style={ReactDOM.Style.make(~textAnchor="middle", ())} className="text-lg text-gray-400 fill-current">
        {React.string(`7`)} 
      </text>
    </svg>
  </section>
}
