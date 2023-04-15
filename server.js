const express = require('express');
const bodyParser = require('body-parser');
const app = express();
var morgan = require('morgan');

//parse application/json
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(morgan('dev'));

// routes
var routes = require('./routes');
routes(app);

// group of auth endpoint route
app.use('/auth', require('./middleware'));

app.listen(3000, () => {
    console.log(`Server started on port`);
});
