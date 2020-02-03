
const github = require('@koopjs/provider-github');

const outputs = []
const auths = []
const caches = []
const plugins = [
  {
    instance: github
  }
]
module.exports = [...outputs, ...auths, ...caches, ...plugins]
