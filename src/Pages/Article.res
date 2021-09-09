@react.component
let make = (~id: string) => {
  <main className="mx-auto p-4 max-w-screen-xl">
    <Navigation />
    <h1 className="font-bold"> 
      {React.string(id)} 
    </h1>
    <p>
      {React.string("Blabla je parle, je dis des trucs !")} 
    </p>
  </main>
}