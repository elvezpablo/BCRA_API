import React, { useState, useEffect } from "react";

const App = () => {
  const [state, setState] = useState({ isLoading: false });
  useEffect(() => {
    async function fetchData() {
      const response = await fetch("http://localhost:8000/relative.risk");
      console.log(await response.json());
    }
    fetchData();
  });

  return <div>{"Results"}</div>;
};

export default App;
