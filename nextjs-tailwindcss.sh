yarn create next-app --typescript .

# updating .gitignore
cat >>.gitignore <<.gitignore

# lock files
package-lock.json
yarn.lock
.gitignore

# purging unnecessary files
rm styles/Home.module.css
git rm --cached package-lock.json
git rm --cached yarn.lock

# adding dependencies
yarn add -D tailwindcss postcss autoprefixer prettier prettier-plugin-tailwindcss

# initializing tailwindcss with postcss
npx tailwindcss init -p

# updating files for compatibility
curl -s https://raw.githubusercontent.com/vercel/next.js/canary/examples/with-tailwindcss/pages/index.tsx >pages/index.tsx
curl -s https://raw.githubusercontent.com/vercel/next.js/canary/examples/with-tailwindcss/styles/globals.css >styles/globals.css
curl -s https://raw.githubusercontent.com/vercel/next.js/canary/examples/with-tailwindcss/tailwind.config.js >tailwind.config.js

# personal preferences
sed -i '' 's#"compilerOptions": {#"compilerOptions": {\n    "baseUrl": ".",#g' tsconfig.json
