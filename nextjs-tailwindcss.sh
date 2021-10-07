yarn create next-app -e with-tailwindcss .
yarn add @tailwindcss/typography @tailwindcss/forms @tailwindcss/line-clamp @tailwindcss/aspect-ratio

mkdir -p styles
sed -i '' 's#tailwindcss/tailwind.css#styles/globals.css#g' pages/_app.js

cat >>.gitignore <<.gitignore

# lock files
package-lock.json
yarn.lock
.gitignore

cat >>styles/globals.css <<globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;
globals.css

cat >>jsconfig.json <<jsconfig.json
{
  "compilerOptions": {
    "baseUrl": "."
  }
}
jsconfig.json

cat >>next.config.js <<next.config.js
module.exports = {
  reactStrictMode: true,
}
next.config.js

git rm -r --cached yarn.lock
