const mysql = require('promise-mysql');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'electron'
});

function getConnection() {
  return connection;
}

module.exports = { getConnection };