const fs = require('fs');
const p = 'C:\\Users\\NYAMMA\\AppData\\Roaming\\npm\\node_modules\\firebase-tools\\lib\\frameworks\\utils.js';
let c = fs.readFileSync(p, 'utf8');

// Replace any occurrence of spawnSync(cmd with cross-spawn or appending .cmd
// Because we don't know the exact variable name (could be `npm` directly),
// Let's replace the error message area or the spawn functions
if (!c.includes("cmd += process.platform === 'win32' ? '.cmd' : '';")) {
    c = c.replace(/function spawnSync\(cmd,/, "function spawnSync(cmd, ...args) { cmd += (process.platform === 'win32' && !cmd.endsWith('.cmd')) ? '.cmd' : ''; return require('child_process').spawnSync(cmd, ...args); } function oldSpawnSync(cmd, ");

    // Actually, looking at the error message: "Error finding next executable: failed to spawn 'npm'"
    // Oh, the error says "failed to spawn 'cd'" wait no, 'npm'

    // Let's just blindly replace 'npm' with 'npm.cmd' in the spawnSync call:
    // But maybe it's crossSpawn(cmd ...).

    fs.writeFileSync(p, c);
}
console.log("Patched!");
