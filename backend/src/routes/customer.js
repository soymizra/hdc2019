const router = require('express').Router();

const customerController = require('../controllers/customerController');

router.get('/users/', customerController.list);
router.get('/users/:id', customerController.user);
router.get('/users/:idTipoUsuario/:id', customerController.chef_platillos);

//router.post('/add', customerController.save);
/*router.get('/update/:id', customerController.edit);
router.post('/update/:id', customerController.update);
router.get('/delete/:id', customerController.delete);*/

module.exports = router;