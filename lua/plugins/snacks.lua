local function getConfigDir()
	if vim.loop.os_uname().sysname == "Darwin" then
		return "~/.config/nvim/"
	elseif vim.loop.os_uname().sysname == "Windows_NT" then
		return "~/AppData/Local/nvim/"
	else
		return "$XDG_CONFIG_HOME/nvim/"
	end
end


local function generateHeader()
	local headers = {
[[     ...     ...                                                    .                       
  .=*8888n.."%888:                                                 @88>                     
 X    ?8888f '8888                     u.        ...     ..        %8P      ..    .     :   
 88x. '8888X  8888>       .u     ...ue888b    :~""888h.:^"888:      .     .888: x888  x888. 
'8888k 8888X  '"*8h.   ud8888.   888R Y888r  8X   `8888X  8888>   .@88u  ~`8888~'888X`?888f`
 "8888 X888X .xH8    :888'8888.  888R I888> X888n. 8888X  ?888>  ''888E`   X888  888X '888> 
   `8" X888!:888X    d888 '88%"  888R I888> '88888 8888X   ?**h.   888E    X888  888X '888> 
  =~`  X888 X888X    8888.+"     888R I888>   `*88 8888~ x88x.     888E    X888  888X '888> 
   :h. X8*` !888X    8888L      u8888cJ888   ..<"  88*`  88888X    888E    X888  888X '888> 
  X888xX"   '8888..: '8888c. .+  "*888*P"       ..XC.    `*8888k   888&   "*88%""*88" '888!`
:~`888f     '*888*"   "88888%      'Y"        :888888H.    `%88>   R888"    `~    "    `"`  
    ""        `"`       "YP'                 <  `"888888:    X"     ""                      
                                                   %888888x.-`                              
                                                     ""**""                                 ]],
[[I use                                                                    
      ████ ██████           █████      ██                        
     ███████████             █████                                
     █████████ ███████████████████ ███   ███████████      
    █████████  ███    █████████████ █████ ██████████████      
   █████████ ██████████ █████████ █████ █████ ████ █████      
 ███████████ ███    ███ █████████ █████ █████ ████ █████     
██████  █████████████████████ ████ █████ █████ ████ ██████    
                                                                      btw]],
[[(\o/)___________________________________________________________(\o/)
(/|\)                                                           (/|\)
  |                                          .-~~~-.              |  
  |                                        /        }             |  
  |                                       /      .-~              |  
  |                             \        |        }               |  
  |             __   __       ___\.~~-.-~|     . -~_              |  
  |            / \./  \/\_       { O |  ` .-~.    ;  ~-.__        |  
  |        __{^\_ _}_   )  }/^\   ~--~/-|_\|   :   : .-~          |  
  |       /  /\_/^\._}_/  //  /     /   |  \~ - - ~               |  
  |      (  (__{(@)}\__}.//_/__A__/_A___|__A_\___A______A_____A   |  
  |       \__/{/(_)\_}  )\\ \\---v-----V----v----v-----V-----v--- |  
  |         (   (__)_)_/  )\ \>                                   |  
  |          \__/     \__/\/\/                                    |  
  |             \__,--'                                           |  
  |                                                               |  
(\o/)___________________________________________________________(\o/)
(/|\)                    |\| [- () \/ | |\/|                    (/|\)]],
[[⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⣾⡳⣼⣆⠀⠀⢹⡄⠹⣷⣄⢠⠇⠻⣷⣶⢀⣸⣿⡾⡏⠀⠰⣿⣰⠏⠀⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⣀⣀⣀⡹⣟⡪⢟⣷⠦⠬⣿⣦⣌⡙⠿⡆⠻⡌⠿⣦⣿⣿⣿⣿⣦⣿⡿⠟⠚⠉⠀⠉⠳⣄⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡀⢀⣼⣟⠛⠛⠙⠛⠉⠻⢶⣮⢿⣯⡙⢶⡌⠲⢤⡑⠀⠈⠛⠟⢿⣿⠛⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀
⠀⠀⠀⠀⠀⡸⠯⣙⠛⢉⣉⣙⣿⣿⡳⢶⣦⣝⢿⣆⠉⠻⣄⠈⢆⢵⡈⠀⠀⢰⡆⠀⣼⠓⠀⠀⠀ N a h   ⠈⣷⠀
⠀⠀⠀⠖⠉⠻⣟⡿⣿⣭⢽⣽⣶⣈⢛⣾⣿⣧⠀⠙⠓⠀⠑⢦⡀⠹⣧⢂⠀⣿⡇⢀⣿⠺⠇⠀   I'd     ⣿⠀
⠀⠀⠀⠀⠐⠈⠉⢛⣿⣿⣶⣤⣈⠉⣰⣗⡈⢛⣇⠀⣵⡀⠀⠘⣿⡄⢻⣤⠀⢻⡇⣼⣧⣿⡄⠀⠀ V I M   ⠀⡿⠀
⠀⠀⠀⠀⠀⣠⣾⣿⢍⡉⠛⠻⣷⡆⠨⣿⣭⣤⣍⠀⢹⣷⡀⠀⠹⣿⡄⠈⠀⢿⠁⣿⣿⠏          ⠀⠀⠀⣇⠀
⠀⠈⢻⣷⣿⣽⣿⣿⢍⣴⡏⠚⢛⣈⣍⠛⠛⠿⢦⣌⢙⠻⡆⠁⠀⠀⠀⣴⣦⠀⠀⠀⠐⢳⢻⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠮⠀⠀
⠀⠀⠈⠙⣿⣧⣶⣿⠿⣧⣴⣿⢻⡉⠀⢀⣠⣴⣾⡟⠿⠃⠁⣠⣤⡶⣾⡟⠅⠀⣀⡄⠀⣾⢸⣿⣏⢻⢶⣦⣤⣤⣄⢶⣾⣿⣡⣤⡄
⠀⠀⣠⣞⣋⣿⣿⣾⣿⡿⡛⣹⡟⣤⢰⡿⠟⠉⣀⣀⣤⣤⡠⠙⢁⣾⡿⠂⠀⣿⠟⣁⠀⣹⠀⣹⣿⡟⣼⣿⣿⣌⣿⣞⣿⣿⠁⠀⠀
⠀⢠⡿⢛⢟⣿⣿⣿⣿⣿⣿⡟⣼⣿⣟⢓⠛⣿⣏⣿⣵⣗⣵⣴⣿⢟⡵⣣⣼⣿⢟⣵⣶⢻⣶⣿⠀⠀⣈⢻⣿⣿⣿⢿⣾⢿⣧⠀⠀
⠀⠀⠀⠜⣿⣾⢿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣭⣿⣖⣿⢿⣿⡿⣿⣿⣿⡿⢡⢯⣿⣿⡵⣿⣿⡵⣿⣧⡿⣾⣷⣿⣿⢿⣿⡇⠉⠁⠀
⠀⠀⠀⠀⣿⣥⣾⣿⣿⣿⣿⣿⣿⣿⡟⣭⠛⢟⣿⠃⠞⠟⣸⣿⠏⣸⣧⣀⠿⢿⣿⠞⣟⣿⣿⠞⢡⣽⣿⢿⣿⣿⣿⣿⣿⠁⠀⠀⠀
⠀⠀⠀⠀⠟⠛⠫⣿⣿⣿⣿⣿⡿⣧⠛⣿⠛⣿⣿⣿⣷⡌⠹⡟⠀⠛⠁ ⠏⣼⣿⣿⣿⣷⡌⠛⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⣧⠀⠀
⠀⠀⠀⠀⠀⠀⠘⠋⣾⣷⣿⣿⣧⠙⠀⠙⢣⠝⠛⠋⣽⣷⢦⠇⠀⠀  ⠞⣤⠙⢣⠝⠛⠋⣽⠘⢻⣿⣿⢿⣼⣷⡟⢻⣷⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠐⠟⢻⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠉  ⠀⠀⠀⠀⣾⠟⠀⢸⣷⣿⡇⠀ ⠛⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠁⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠲⣄⠀⡄⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⣀⠀⠀⣠⣾⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⢻⣆⠀⠛⠁⠶⣶⣶⣶⣶⣶⣶⡶⠆⠘⠋⣠⡾⢫⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠛⠀⠙⣷⡀⠀⠀⠙⠛⠛⠛⠛⠋⠁⠀⢀⣴⠋⠀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⣰⣦⡀⠸⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣴⡟⠁⠀⠐⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⡄⢺⣿⡄⠹⣿⠻⢦⣤⣤⣤⣤⣶⣿⡟⢀⣀⠀⠀⢸⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣮⣿⣿⡀⠹⡷⣦⣀⡀⡀⢸⣿⠏⢠⣾⣿⠀⠀⣾⣿⣿⣿⣶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀
⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠘⣷⣻⡟⠀⡼⠁⣴⣿⣿⣯⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣯⣿⣤⣤⣤⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄]],		
[[ ---------------------------------------------- 
/                                              \
|  ( ) ( )              ( ) ( ) _              |
|  |  \| |   __     _   | | | |(_)  ___ ___    |
|  |     | / __ \ / _ \ | | | || |/  _   _  \  |
|  | | \ |(  ___/( (_) )| \_/ || || ( ) ( ) |  |
|  (() (_))\ (__) \ __/  \___/ ( )(() ( ) (_)  |
|  (_)     (__)   /(           /( (_) /(       |
|                (__)         (__)   (__)      |
\                                              /
 ---------------------------------------------- 
        \   ^__^                    ooOO        
         \  (oo)\_______       ~moOO            
            (__)\       )\/\                    
                ||----w |                       
                ||     ||                       ]],		
[[   The Elites Worship                                 
                                          _.oo.       
                  _.u[[/;:,.         .odMMMMMM'       
               .o888UU[[[/;:-.  .o@P^    MMM^         
              oN88888UU[[[/;::-.        dP^           
             dNMMNN888UU[[[/;:--.   .o@P^             
            ,MMMMMMN888UU[[/;::-. o@^                 
            NNMMMNN888UU[[[/~.o@P^                    
            888888888UU[[[/o@^-..                     
           oI8888UU[[[/o@P^:--..                      
        .@^  YUU[[[/o@^;::---..                       
      oMP     ^/o@P^;:::---..                         
   .dMMM    .o@^ ^;::---...                           
  dMMMMMMM@^`       `^^^^                             
 YMMMUP^       _  _  ____  _____  _  _  ____  __  __  
  ^^          ( \| )( ___)(  _  )( \/ )(_  _)(  \/  ) 
               )  (  )__)  )(_)(  \  /  _)(_  )    (  
              (_|\_)(____)(_____)  \/  (____)(_/\/\_) ]]
	}

	math.randomseed(os.time())
	return headers[math.random(1, #headers)] -- Get random header
end

local currentHeader = generateHeader()
local _, headerLC = currentHeader:gsub("\n", "\n")
local headerWidth = vim.fn.strchars(currentHeader:sub(1, currentHeader:find("\n") - 1))
local paneGap = 4
local dashboardWidth = 60
local centeredIndent = dashboardWidth + paneGap
local headerIndent = dashboardWidth + paneGap / 2 - (headerWidth > centeredIndent and math.floor((headerWidth - centeredIndent) / 4) + 1 or 0)


return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", },
	opts = {
		dashboard = {
			enabled = true,
			width = dashboardWidth,
			pane_gap = paneGap,
			preset = {
				pick = nil,
				header = currentHeader,
				keys = {
					{
						key = "f",
						action = ":Telescope file_browser",
						desc = "Open folder",
						icon = " ",
					},
					{
						key = "F",
						action = ":Telescope find_files",
						desc = "Open file",
						icon = " ",
					},
					{
						key = "c",
						action = ":cd " .. getConfigDir(),
						desc = "Open Config Folder",
						icon = " ",
					},
					{
						key = "t",
						action = ":botright split | terminal",
						desc = "Open Terminal",
						icon = " ",
					},
					{
						key = "m",
						action = ":Mason",
						desc = "Mason",
						icon = "󰣈 ",
					},
					{
						key = "l",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
						desc = "Lazy",
						icon = "󰒲 ",
					},
					{
						key = "q",
						action = ":qa",
						desc = "Quit",
						icon = " ",
					},
				},
			},
			formats = {
				header = {
					align = "left",
				},
				key = function(item)
					return {
						{
							"[",
							hl = "special",
						},
						{
							item.key,
							hl = "key",
						},
						{
							"]",
							hl = "special",
						},
					}
				end,
			},
			sections = {
				{
					section = "header",
					indent = headerIndent,
				},
				{
					text = { { os.date("\n%Y-%m-%d\n"), } },
					indent = centeredIndent,
					padding = 1,
					align = "center",
				},

				{ -- Pane 1
					pane = 1,
					{
						section = "keys",
						gap = 1,
						padding = 2,
					},
				},
				{ -- Pane 2
					pane = 2,
					{
						padding = headerLC + 6 -- 6 lines to compensate for the date
					},
					{
						title = "Recent Projects",
						icon = " ",
						indent = 4,
						padding = 1,
						section = "projects"
					},
					{
						title = "Recent Files",
						icon = " ",
						indent = 4,
						padding = 2,
						section = "recent_files",
					},
				},

				{
					section = "startup",
					indent = centeredIndent,
				},
			},
		},
	},
	init = function ()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.dashboard()
			end
		})
	end
}
