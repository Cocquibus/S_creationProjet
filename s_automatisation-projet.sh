#! /bin/bash
echo '''  _____ _____   ____   _____ _    _       _______ 
 / ____|  __ \ / __ \ / ____| |  | |   /\|__   __|
| |  __| |__) | |  | | |    | |__| |  /  \  | |   
| | |_ |  _  /| |  | | |    |  __  | / /\ \ | |   
| |__| | | \ \| |__| | |____| |  | |/ ____ \| |   
 \_____|_|  \_\\____/ \_____|_|  |_/_/    \_\_|  '''

echo " "
echo "nom du dossier:"
read dossier
echo "nom du depot"
read depot
echo "username du github"
read nom
mkdir -p $dossier/public/{img/,js/,sass/modules,fonts/,css/} && touch $dossier/index.html $dossier/public/css/minireset.css $dossier/public/sass/app.sass $dossier/public/sass/modules/_fonts.sass $dossier/public/sass/modules/_variables.sass $dossier/public/sass/modules/_header.sass $dossier/public/sass/modules/_main.sass $dossier/public/sass/modules/_footer.sass $dossier/public/sass/modules/_icons.sass $dossier/public/sass/modules/_media.sass
cd $dossier/
npm init -y
npm install bootstrap
npm install @popperjs/core
npm install @fortawesome/fontawesome-free
sudo chmod -R 777 ../$dossier
cd public/sass
echo "@import '../../node_modules/bootstrap/scss/bootstrap.scss'
@import '../css/minireset.css'
@import 'modules/_variables.sass'
@import 'modules/_fonts.sass'
@import 'modules/_icons.sass'
@import 'modules/_header.sass'
@import 'modules/_main.sass'
@import 'modules/_footer.sass'
@import 'modules/_media.sass'
" > app.sass
cd modules/
echo '$fa-font-path : "../../node_modules/@fortawesome/fontawesome-free/webfonts"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/fontawesome.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/solid.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/brands.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/regular.scss"
' > _icons.sass
echo '@import "_variables.sass"' > _header.sass
echo '@import "_variables.sass"' > _main.sass
echo '@import "_variables.sass"' > _footer.sass
echo '@import "_variables.sass"' > _media.sass
cd ../../css
echo '/*! minireset.css v0.0.6 | MIT License | github.com/jgthms/minireset.css */html,body,p,ol,ul,li,dl,dt,dd,blockquote,figure,fieldset,legend,textarea,pre,iframe,hr,h1,h2,h3,h4,h5,h6{margin:0;padding:0}h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal}ul{list-style:none}button,input,select{margin:0}html{box-sizing:border-box}*,*::before,*::after{box-sizing:inherit}img,video{height:auto;max-width:100%}iframe{border:0}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}
' > minireset.css
cd ../../
echo '
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Document</title>
</head>

<body>
    <header>
        <nav></nav>
    </header>
    <main>
        <section></section>
    </main>
    <footer></footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
'   > index.html
git init
git add --all
git commit -m "first commit"
git branch -m main
git remote add origin https://github.com/$nom/$depot.git
git push -u origin main
code .
sass --watch public/sass/app.sass public/css/style.css