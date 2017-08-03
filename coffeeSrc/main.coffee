electron = require 'electron'
app = electron.app
BrowserWindow = electron.BrowserWindow
path = require 'path'
url = require 'url'

win = null

createWindow = ->
	win = new BrowserWindow {width: 850, height: 650}

	win.loadURL url.format {
							pathname: path.join __dirname, '../html/index.html'
							protocol: 'file:'
							slashes: true
						}

	win.on 'closed', () ->
						win = null

app.on 'ready', createWindow

app.on 'browser-window-created', (e, window) ->
										window.setMenu null

app.on 'window-all-closed', () ->
								if process.platform != 'darwin'
									app.quit()

app.on 'activate', () ->
						if win == null
							createWindow()
