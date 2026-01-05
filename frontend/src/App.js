import React, { useEffect, useState } from "react";

function App() {
  const [tables, setTables] = useState([]);     // store fetched tables
  const [error, setError] = useState(null);     // store any fetch error

  useEffect(() => {
    fetch("/students_25/bsandi/Segre-Lab-Metabolic-Data-Explorer/app/api/tables")
      .then((res) => {
        if (!res.ok) throw new Error("Failed to fetch");
        return res.json();
      })
      .then((data) => setTables(data))
      .catch((err) => setError(err.message));
  }, []);


  return (
    <div style={{ padding: "20px", fontFamily: "sans-serif" }}>
      <h1>📊 Tables in Database</h1>
      {error && <p style={{ color: "red" }}>Error: {error}</p>}
      <ul>
        {tables.map((table, index) => (
          <li key={index}>{table}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
