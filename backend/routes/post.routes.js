import {Router} from "express";
import {Posts, Users} from "../db.js";
const router = Router();

router.get("/all", async (req, res) => { 
    try {
        const posts = await Posts.findAll({
            order: [
                ['createdAt', 'DESC']
            ],
        });
        res.json(posts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/:id", async (req, res) => {
    try {
        const post = await Posts.findByPk(req.params.id, {
            include: [{
                model: Users, //here is an inner join between posts and users to get the user's name and phone
                attributes: ['fullName', 'phone'],
                required: true
            }]
        });
        res.json(post);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/category/:category", async (req, res) => {
    try {
        const post = await Posts.findAll({ 
            order: [
                ['createdAt', 'DESC']
            ],
            where: { category: req.params.category } });
        res.json(post);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post("/create", async (req, res) => {
    try {
        console.log(req.body);
        const post = await Posts.create(req.body);
        res.json(post);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

export default router;