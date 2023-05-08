reload('user.keymaps')
reload('user.options')
reload('user.plugins')
reload('user.plugins-config')

require('dap.ext.vscode').load_launchjs(nil, { node = { 'typescript', 'typescriptreact' } })
