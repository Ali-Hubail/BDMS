
import express from "express";
import { personRouter } from "./routes/person";
import { authRouter } from "./routes/auth";
import { reportRouter } from "./routes/report";
import { requestRouter } from "./routes/request";
import { userRouter } from "./routes/user";


const app = express();
const port = 8080;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/auth", authRouter)
app.use("/person", personRouter);
app.use("/report", reportRouter);
app.use("/request", requestRouter);
app.use('/user',userRouter)
app.get("*", async (req, res) => {
  res.status(404).send("404 Not Found");
});

app.listen(port, () => {
  console.log(`app listening at http://localhost:${port}`);
});