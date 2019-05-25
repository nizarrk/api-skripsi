var NodeGeocoder = require('node-geocoder');
 
var options = {
  provider: 'here',
 
  // Optional depending on the providers
  appId: 'cX5rfU6D1cSiACyKEWDz',
  appCode: 'GVFwmLCfnJA4BIo2tKkolg',
  httpAdapter: 'https', // Default
  formatter: 'json'         // 'gpx', 'string', ...
};
 
var geocoder = NodeGeocoder(options);

module.exports = geocoder;