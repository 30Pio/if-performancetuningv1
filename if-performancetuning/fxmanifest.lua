

fx_version 'adamant'

game 'gta5'

version '1.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/assets/js/main.js',
    'html/assets/js/vendor/*.js',
    'html/assets/css/*.css',
    'html/assets/img/*.png',
    'html/assets/img/*.svg',
    'html/assets/font/*.woff2',
}
client_scripts{
    'config.lua',
    'client.lua',
}

server_scripts{
    'config.lua',
    'server.lua',
}
