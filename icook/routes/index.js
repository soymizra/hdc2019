var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'iCook' });
});


/*router.get('/users/:id', (req, res)=>{
  res.send('Un usuario');
});*/

module.exports = router;
