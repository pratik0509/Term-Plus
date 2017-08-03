os = require 'os'
pty = require 'node-pty'

term = new Terminal options
term.open document.getElementById 'xterm-container'
term.fit()
term.focus()
shell = process.env[if os.platform() == 'win32' then 'COMSPEC' else 'SHELL']

ptyProcess = pty.spawn shell, [], {
									name: 'xterm-256color'
									cwd:  process.cwd()
									env:  process.env
								}

term.on 'data', (data) ->
					ptyProcess.write data

ptyProcess.on 'data', (data) ->
						term.write data
