// Launch a NodeJS REPL with a specific prompt.
const repl = require('repl');
const replServer = repl.start({ prompt: 'JavaScript> ' });
replServer.setupHistory('.node_repl_history', () => {});
