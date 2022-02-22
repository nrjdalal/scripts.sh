 yarn create next-app --typescript .

# updating .gitignore
cat >>.gitignore <<.gitignore

# lock files
package-lock.json
yarn.lock
.gitignore

cat >README.md <<README.md
## Next.js + Tailwind CSS

This is a custom [Next.js](https://nextjs.org/) project bootstrapped with

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/scripts.sh/master/nextjs-tailwindcss.sh)"
```

## Resources

- Click [here](https://vercel.com/new) to deploy on Vercel
README.md

# purging unnecessary files
rm styles/Home.module.css
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
yarn add -D @tailwindcss/forms @tailwindcss/line-clamp @tailwindcss/typography
sed -i '' "s#plugins: \[\],#plugins: \[\n    '@tailwindcss/forms',\n    '@tailwindcss/line-clamp',\n    '@tailwindcss/typography',\n  \],#g" tailwind.config.js
