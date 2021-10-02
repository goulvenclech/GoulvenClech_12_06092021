@react.component
let make = (~id: string) => {
  <main className="mx-auto p-4 max-w-screen-xl flex flex-col gap-4">
    <Navigation /> 
    <GraphActivity id={id} />
    <div className="flex gap-4">
      <GraphSessions id={id} />
      <GraphPerformances id={id} />
      <GraphScore id={id} />
    </div>
  </main>
}
