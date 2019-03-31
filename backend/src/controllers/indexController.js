const controller = {};

controller.home = (req, res) => {
    res.render('index', {
        data: "hola"
     });
};



module.exports = controller;