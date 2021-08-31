@react.component
let make = () => {
  <main className="mx-auto my-4 max-w-lg">
    <h1 className="font-bold"> 
      {React.string("Cette page n'existe pas !")} 
    </h1>
    <p>
      {React.string("Voila qui est fort facheux...")}
    </p>
    <Navigation />
  </main>
}