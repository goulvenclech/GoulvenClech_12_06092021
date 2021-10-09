@react.component
let make = () => {
  <main className="mx-auto p-4 flex flex-col gap-4 max-w-screen-xl">
    <Navigation />
    <h1 className="font-bold"> 
      {React.string("Cette page n'existe pas !")} 
    </h1>
    <p>
      {React.string("Voila qui est fort facheux...")}
    </p>
    <Footer />
  </main>
}