@react.component
let make = (~id: string) => {
  <main className="mx-auto my-4 max-w-lg">
    <h1 className="font-bold"> 
      {React.string(id)} 
    </h1>
    <p>
      {React.string("Blabla je parle, je dis des trucs !")} 
    </p>
    <Navigation />
  </main>
}