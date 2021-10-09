@react.component
let make = () => {
  <>
    <Navigation /> 
    <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
      <Title />
      <SitePlan />
      <Footer />
    </main>
  </>
}
