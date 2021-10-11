@react.component
let make = () => {
  <>
    <Navigation />
    <Aside />
    <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
      <h2 className="pt-8 mx-4 text-5xl font-bold w-full leading-relaxed"> 
          {React.string(`Erreur `)}
          <span className="text-red-600">
          {React.string(`404`)}
          </span>
      </h2>
      <p className="px-4">
        {React.string("Voila qui est fort facheux...")}
      </p>
      <Footer />
    </main>
  </>
}