@react.component
let make = (~id: string) => {
  <>
    <Navigation /> 
    <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
      <Welcome id={id} />
      <GraphActivity id={id} />
      <div className="flex gap-4 mx-4">
        <GraphSessions id={id} />
        <GraphPerformances id={id} />
        <GraphScore id={id} />
      </div>
      <Footer />
    </main>
  </>
}
