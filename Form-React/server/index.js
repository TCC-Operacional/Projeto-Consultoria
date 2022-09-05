const express = require("express");
const app = express();
const bodyParser = require("body-parser");
var cors = require('cors');

const router = require("./route/index");

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(cors());
app.set('view engine', 'ejs');


app.use("/", router);

app.get("/", (req, res)=>{
    res.send("Página Inicial!");
});

app.listen(3001,() => {
    console.log("Servidor rodando na porta 3001...")
});