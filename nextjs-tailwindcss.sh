yarn create next-app -e with-tailwindcss .

echo -e "\n# lock files\npackage-lock.json\nyarn.lock" >>.gitignore

mkdir -p styles
echo -e "@tailwind base;\n@tailwind components;\n@tailwind utilities;" >>styles/global.css

sed -i '' 's#tailwindcss/tailwind.css#../styles/globals.css#g' pages/_app.js
