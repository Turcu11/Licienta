import { Router } from "express";
import { Posts, Users } from "../db.js";
const router = Router();

router.get("/all-open-posts", async (req, res) => {
    try {
        const posts = await Posts.findAll({
            where: {
                isDone: false
            },
            order: [
                ['createdAt', 'DESC']
            ],
        });
        res.json(posts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/all-done-posts", async (req, res) => {
    try {
        const posts = await Posts.findAll({
            where: {
                isDone: true
            },
            order: [
                ['createdAt', 'DESC']
            ],
        });

        const users = await Users.findAll({
            attributes: { exclude: ['password'] },
        });

        const postsWithUsers = posts.map(post => {
            const client = users.find(user => user.id === post.userID);
            const serviceProvider = users.find(user => user.id === post.serviceProviderID);
            return {
                ...post.toJSON(),
                client,
                serviceProvider
            };
        });
        if (postsWithUsers.length === 0) {
            res.json({ message: "No completed posts found" });
            return;
        }
        res.json(postsWithUsers);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/all-done-posts/:serviceProviderId", async (req, res) => {
    try {
        const posts = await Posts.findAll({
            where: {
                isDone: true,
                serviceProviderID: req.params.serviceProviderId
            },
            order: [
                ['createdAt', 'DESC']
            ],
        });

        const users = await Users.findAll({
            attributes: { exclude: ['password'] },
        });

        const postsWithUsers = posts.map(post => {
            const client = users.find(user => user.id === post.userID);
            const serviceProvider = users.find(user => user.id === post.serviceProviderID);
            return {
                ...post.toJSON(),
                client,
                serviceProvider
            };
        });
        if (postsWithUsers.length === 0) {
            res.json([]);
            return;
        }
        res.json(postsWithUsers);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get("/:id", async (req, res) => {
    try {
        const post = await Posts.findByPk(req.params.id, {
            include: [{
                model: Users,
                attributes: ['fullName', 'phone', 'rating'],
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
            where: { category: req.params.category }
        });
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

router.put("/update/:id", async (req, res) => {
    try {
        const post = await Posts.findByPk(req.params.id);
        if (post) {
            await post.update(req.body);
            res.json({ message: "Post updated", post });
        } else {
            res.status(404).json({ message: "Post not found" });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put("/mark-post-as-done/:postId/:serviceProviderId", async (req, res) => {
    try {
        const post = await Posts.findByPk(req.params.postId);
        if (post) {
            post.isDone = true;
            post.serviceProviderID = req.params.serviceProviderId;
            await post.save();
            res.json({ message: "Post updated", post });
        } else {
            res.status(404).json({ message: "Post not found" });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete("/:id", async (req, res) => {
    try {
        const post = await Posts.findByPk(req.params.id);
        await post.destroy();
        res.json({ message: "Post deleted" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

export default router;