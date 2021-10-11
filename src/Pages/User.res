@react.component
let make = (~id: string) => {
  <>
    <Navigation /> 
    <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
      <Welcome id={id} />
      <div className="flex flex-wrap lg:flex-nowrap gap-4 lg:gap-0">
        <div className="flex flex-col gap-4">
          <GraphActivity id={id} />
          <div className="flex gap-4 mx-4">
            <GraphSessions id={id} />
            <GraphPerformances id={id} />
            <GraphScore id={id} />
          </div>
        </div>
      <UserData />
      </div>
      <Footer />
    </main>
  </>
}
