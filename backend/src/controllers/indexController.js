const controller = {};

controller.home = (req, res) => {
    res.render('index');
};

controller.login = (req, res) => {
    res.render('login');
};

controller.buscarPlatillos = (req, res) => {
    res.render('buscar_platillos');
}



module.exports = controller;