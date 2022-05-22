import { defineConfig } from 'vite' 
import react from '@vitejs/plugin-react' 
export default defineConfig({ 
  server: { 
    port: 2736 
  }, 
  preview: { 
    port: 8080 
  }, 
  build: {  
    outDir: './dist' 
  }, 
  base: '/www-react-heroku/', 
  plugins: [react()] 
}) 
