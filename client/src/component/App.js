import React, { useState, useEffect } from "react";

const App = () => {
  const [state, setState] = useState({ data: [] });
  useEffect(() => {
    async function fetchData() {
      const response = await fetch("http://localhost:8000/relative.risk");

      setState({ data: await response.json() });
    }
    fetchData();
  });

  return <div>{`Results: ${JSON.stringify(state)}`}</div>;
};

export default App;
