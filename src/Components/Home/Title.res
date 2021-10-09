@react.component
let make = () => {
  <h2 className="py-8 mx-4 text-5xl font-bold w-full leading-relaxed"> 
      {React.string(`Bienvenue sur `)}
      <span className="text-red-600">
      {React.string(`SportSee`)}
      </span>
  </h2>
}
