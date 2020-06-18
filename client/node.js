const got = require("got");

got("http://localhost:8000/relative.risk")
  .then((response) => {
    console.log(response.body);
  })
  .catch((error) => {
    console.log(error.response.body);
  });
