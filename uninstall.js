const fs = require("fs");
const os = require("os");
const YAML = require("yaml");

// Read and parse the Dotbot configuration
const file = fs.readFileSync("install.conf.yaml", "utf8");
const config = YAML.parse(file);

// Helper to expand the tilde (~) into the home directory path
const expandUser = (p) => p.replace(/^~(?=$|\/)/, os.homedir());

for (const section of config) {
  if (section && section.link) {
    for (const target of Object.keys(section.link)) {
      const fullPath = expandUser(target);

      try {
        // Check if the file exists and is a symlink
        const stats = fs.lstatSync(fullPath);

        if (stats.isSymbolicLink()) {
          console.log(`Removing symlink: ${fullPath}`);
          fs.unlinkSync(fullPath);
        }
      } catch (err) {
        // Safe skip if the file or link does not exist
        if (err.code !== "ENOENT") {
          console.error(`Error processing ${fullPath}:`, err.message);
        }
      }
    }
  }
}
