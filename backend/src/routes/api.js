const router = require('express').Router();

const apiController = require('../controllers/apiController');

router.get('/users/', apiController.list);
router.get('/users/:id', apiController.user);
router.get('/platillos/', apiController.platillos);

//router.post('/add', customerController.save);
/*router.get('/update/:id', customerController.edit);
router.post('/update/:id', customerController.update);
router.get('/delete/:id', customerController.delete);*/

module.exports = router;