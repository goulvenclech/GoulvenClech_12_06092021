/**
 * Home page of our application.
 */
@react.component
let make = () => {
  <>
    <Header /> 
    <Aside />
    <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
      <Title />
      <SitePlan />
      <Footer />
    </main>
  </>
}
