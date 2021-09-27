@react.component
let make = (~id: string) => {
  <main className="mx-auto p-4 max-w-screen-xl flex flex-col gap-4">
    <Navigation /> 
    <GraphScore id={id} />
  </main>
}
