const router = require('express').Router();

const indexController = require('../controllers/indexController');

router.get('/', indexController.home);
router.get('/login', indexController.login);
router.get('/buscarPlatillo/', indexController.buscarPlatillos);
//router.post('/add', customerController.save);
/*router.get('/update/:id', customerController.edit);
router.post('/update/:id', customerController.update);
router.get('/delete/:id', customerController.delete);*/

module.exports = router;