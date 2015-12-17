var crondbclean = require('./cron-dbclean');
var CronJob = require('cron').CronJob;



module.exports = {

  schedulejob: function() {

   new CronJob('*/1 * * * *', crondbclean.job, null, true, 'America/Los_Angeles');

  }
  
};

