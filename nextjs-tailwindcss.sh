yarn create next-app -e with-tailwindcss .

cat >>.gitignore <<.gitignore

# lock files
package-lock.json
yarn.lock
.gitignore

yarn add @tailwindcss/typography @tailwindcss/forms @tailwindcss/line-clamp @tailwindcss/aspect-ratio

mkdir -p styles

cat >>styles/globals.css <<globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;
globals.css

sed -i '' 's#tailwindcss/tailwind.css#styles/globals.css#g' pages/_app.js

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

yarn dev
