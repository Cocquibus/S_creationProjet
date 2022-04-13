#! /bin/bash
echo '''  _____ _____   ____   _____ _    _       _______ 
 / ____|  __ \ / __ \ / ____| |  | |   /\|__   __|
| |  __| |__) | |  | | |    | |__| |  /  \  | |   
| | |_ |  _  /| |  | | |    |  __  | / /\ \ | |   
| |__| | | \ \| |__| | |____| |  | |/ ____ \| |   
 \_____|_|  \_\\____/ \_____|_|  |_/_/    \_\_|  '''

echo "nom du dossier:"
read dossier
mkdir -p $dossier/public/{img/,js/,sass/,fonts/,css/} && touch $dossier/index.html $dossier/public/sass/app.sass $dossier/public/sass/_fonts.sass $dossier/public/sass/_variables.sass $dossier/public/sass/_header.sass $dossier/public/sass/_main.sass $dossier/public/sass/_footer.sass $dossier/public/sass/_style.sass $dossier/public/sass/_icons.sass
cd $dossier/
npm init -y
npm install bootstrap
npm install @popperjs/core
npm install @fortawesome/fontawesome-free
sudo chmod -R 777 ../$dossier
cd public/sass
echo "
@import '../../node_modules/bootstrap/scss/bootstrap.scss'
@import '_variables.sass'
@import '_fonts.sass'
@import '_icons.sass'
@import '_styles.sass'
@import '_header.sass'
@import '_main.sass'
@import '_footer.sass'
" > app.sass
cd ../../
echo '
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/style.style.css">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
'   > index.html
code .