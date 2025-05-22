// patched Next.js config to ignore Android dirs
module.exports = {
  webpack(cfg) {
    cfg.watchOptions = { ignored: ['/data/**', '**/node_modules/**'] };
    return cfg;
  },
};
