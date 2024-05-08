import {Router} from "express";
import {Users} from "../db.js";
const router = Router();

///get all the users
router.get("/all", async (req, res) => { 
    try {
        const users = await Users.findAll();
        res.json(users);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

///get user by id
router.get("/:id", async (req, res) => {
    try {
        const user = await Users.findByPk(req.params.id);
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

////get user by email
router.get("/email/:email", async (req, res) => {
    try {
        const user = await Users.findOne({ where: { email: req.params.email } });
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

///create a user
router.post("/", async (req, res) => {
    try {
        console.log(req.body);
        const user = await Users.create(req.body);
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

export default router;