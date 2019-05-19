'use strict';

module.exports = function(app) {
    var users = require('./controller');

    app.route('/')
        .get(users.index);

    app.route('/users')
        .get(users.users);

    app.route('/users/:user_id')
        .get(users.findUsers);

    app.route('/users')
        .post(users.createUsers);

    app.route('/users')
        .put(users.updateUsers);
    
    app.route('/users')
        .delete(users.deleteUsers);
};