const fs = require('fs');
const p = 'C:\\Users\\NYAMMA\\AppData\\Roaming\\npm\\node_modules\\firebase-tools\\lib\\frameworks\\utils.js';
let c = fs.readFileSync(p, 'utf8');

c = c.replace(/function getNpmRoot\(cwd\) \{[\s\S]*?return npmRoot;\}/, 'function getNpmRoot(cwd) { return require("path").join(cwd, "node_modules"); }');

fs.writeFileSync(p, c);
console.log('Patch complete.');
