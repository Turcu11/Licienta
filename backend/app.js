import express from "express";
import usersRouter from "./routes/user.routes.js";
import postsRouter from "./routes/post.routes.js";

const app = express();
const port = 3000;

app.use(express.json());
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*'); 
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
})

app.use("/users", usersRouter);
app.use("/posts", postsRouter);

app.use((err, req, res, next) => {
    if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
        console.error(err);
        return res.status(400).send({ message: "Invalid JSON payload" });
    }
    next();
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});