yarn create next-app -e with-tailwindcss .
yarn add @tailwindcss/typography @tailwindcss/forms @tailwindcss/line-clamp @tailwindcss/aspect-ratio

echo -e "\n# lock files\npackage-lock.json\nyarn.lock" >>.gitignore

mkdir -p styles
echo -e "@tailwind base;\n@tailwind components;\n@tailwind utilities;" >>styles/global.css

sed -i '' 's#tailwindcss/tailwind.css#styles/globals.css#g' pages/_app.js

cat >>jsconfig.json <<CREATE
{
  "compilerOptions": {
    "baseUrl": "."
  }
}
CREATE

cat >>next.config.js <<CREATE
module.exports = {
  reactStrictMode: true,
}
CREATE

yarn dev
