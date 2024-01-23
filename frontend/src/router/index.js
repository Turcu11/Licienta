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
      component: () => import('../views/CreatePostView.vue')
    }
  ]
})

export default router
