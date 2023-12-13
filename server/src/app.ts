
import express, { Request, Response, NextFunction } from "express";
import { person } from "./schema";
import { personRouter } from "./routes/person";


const app = express();
const port = 8080;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/person", personRouter);

app.get("*", async (req, res) => {
  res.status(404).send("404 Not Found");
});

app.listen(port, () => {
  console.log(`app listening at http://localhost:${port}`);
});