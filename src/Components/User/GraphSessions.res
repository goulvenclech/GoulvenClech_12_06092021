@module("../D3/LinearChart") external linearChart: (~data: array<int>) => unit = "linearChart"

@react.component
let make = (~sessions: array<int>) => {
  // will fill our SVG with some d3 black magic 🧙🏼‍♂️🪄⚗️✨
  linearChart(~data = sessions)

  <section className="relative bg-red-600 rounded-lg w-72 h-72 overflow-hidden">
    <h3 className="absolute left-3 top-3 w-3/4 font-semibold text-red-300 text-lg "> 
      {React.string(`Durée moyenne des sessions`)} 
    </h3>
    // empty svg used by d3
    <svg id="linearChart" className="h-72 block">
      // Some text for days of the week
      <text x="20" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`L`)} 
      </text>
      <text x="61" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`M`)} 
      </text>
      <text x="102" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`M`)} 
      </text>
      <text x="143" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`J`)} 
      </text>
      <text x="184" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`V`)} 
      </text>
      <text x="225" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`S`)} 
      </text>
      <text x="266" y="270" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`D`)} 
      </text>
    </svg>
  </section>
}
