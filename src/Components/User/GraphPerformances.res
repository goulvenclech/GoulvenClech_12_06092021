@module("../D3/SpiderChart") external spiderChart: (~data: array<int>) => unit = "spiderChart"
/**
 * A chart showing the user performances. Filled by D3.js.
 */
@react.component
let make = (~performances: array<int>) => {
  // will fill our SVG with some D3 black magic 🧙🏼‍♂️🪄⚗️✨
  spiderChart(~data = performances)

  <section className="bg-gray-900 rounded-lg py-4 w-72 h-72">
    // empty svg used by D3
    <svg id="SpiderChart" className="ml-1 h-72 block">
      // background white hexagons
      <path d="M140,103.75L117.26683315065848,116.87499999999999L117.26683315065848,143.125L140,156.25L162.7331668493415,143.125L162.7331668493415,116.875L140,103.75" 
        strokeWidth="1" stroke="white" fill="transparent" strokeOpacity="1" fillOpacity="0.5" />
      <path d="M140,77.5L94.53366630131697,103.74999999999999L94.53366630131697,156.25L140,182.5L185.466333698683,156.25000000000003L185.46633369868303,103.75L140,77.5" 
        strokeWidth="1" stroke="white" fill="transparent" strokeOpacity="1" fillOpacity="0.5" />
      <path d="M140,51.25L71.80049945197547,90.62499999999997L71.80049945197544,169.37499999999997L139.99999999999997,208.75L208.1995005480245,169.37500000000003L208.19950054802456,90.625L140,51.25" 
        strokeWidth="1" stroke="white" fill="transparent" strokeOpacity="1" fillOpacity="0.5" />
      <path d="M140,25L49.067332602633954,77.49999999999997L49.067332602633925,182.49999999999997L139.99999999999997,235L230.93266739736603,182.50000000000006L230.93266739736606,77.5L140,25" 
      strokeWidth="1" stroke="white" fill="transparent" strokeOpacity="1" fillOpacity="0.5"></path>
      // Some text
      <text x="140" y="20" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Intensité`)} 
      </text>
      <text x="25" y="75" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Cardio`)} 
      </text>
      <text x="25" y="195" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Énergie`)} 
      </text>
      <text x="140" y="250" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Endurance`)} 
      </text>
      <text x="250" y="195" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Force`)} 
      </text>
      <text x="255" y="75" className="text-sm" style={ReactDOM.Style.make(~textAnchor="middle", ~fill="white", ())}>
        {React.string(`Vitesse`)} 
      </text>
    </svg>
  </section>
}
