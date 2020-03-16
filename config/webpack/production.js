process.env.NODE_ENV = process.env.NODE_ENV || 'production'
process.env.ROOT_API = process.env.ROOT_API || 'https://cj-rails.herokuapp.com/api/v1';

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
