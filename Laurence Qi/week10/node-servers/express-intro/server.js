const express = require('express');
const ejs = require('ejs');

const app = express();
app.set('view-engine', ejs);

app.listen( 8000, () => {
    console.log('Now listening at http://localhost:8000');
});

app.use(express.static('public') )

// DATABASE


app.get( '/', (req, res) => {
    console.log('Someone');

    res.send('<h1>Hello World from Express<h1/>');
});

app.get('/hello/:person', (req, res) => {
    res.render('greeting.ejs', {
        user: req.params.person, 
        age: Math.random() * 100
    });
})


app.get('/guestbook', (req, res) => {
    res.send('<h2>Sign my Guestbook!!</h2><img src="http://www.fillmurray.com/500/500">')
});


app.get('/dogs/:id', (req, res) => {
    console.log('params',  req);
    console.log('queryString', req.query);
    const dogInfo = {
        name: 'Fido',
        age: 2,
        goodBoy: true
    };

    res.json( dogInfo )
});

app.use( (req, res ) => {
    console.log('Failed request!', req.url);
    // res.sendStatus( 404 );
});