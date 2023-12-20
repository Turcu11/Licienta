import {Router} from "express";
import {Users} from "../db.js";
import bodyParser from "body-parser";
const router = Router();

router.get("/all", async (req, res) => { 
    try {
        const users = await Users.findAll();
        res.json(users);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/:id", async (req, res) => {
    try {
        const user = await Users.findByPk(req.params.id);
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

export default router;