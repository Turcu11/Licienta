import { createRouter, createWebHistory } from 'vue-router'
import LandingView from '../views/LandingView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'landing',
      component: LandingView
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/RegisterView.vue')
    },
    {
      path: '/mainView',
      name: 'mainView',
      component: () => import('../views/MainView.vue'),
      meta: {
        requiresAuth: false 
      }
    },
    {
      path: '/postDetail/:id',
      name: 'postDetail',
      component: () => import('../views/PostDetailView.vue')
    },
    {
      path: '/createPost',
      name: 'createPost',
      component: () => import('../views/CreatePostView.vue'),
      beforeEnter: (to, from, next) => {
        if (!localStorage.getItem('user')) {
            next({ name: 'login' }); // Redirect to the "Login" page
            alert('Please login to create a post');
        } else {
            next(); // Continue to the "Create Post" page
        }
    },
    }
  ]
})

export default router
