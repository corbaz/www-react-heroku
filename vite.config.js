import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/

export default defineConfig({
  server: {
    port: 2736
  },
  preview: {
    port: 2732
  },
  build: {
    outDir: './public',
  },
  plugins: [react()]
})
