" ========== http://vim.wikia.com/wiki/Switch_color_schemes
" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
" SMH:
" let s:mycolors = ['slate', 'torte', 'darkblue', 'delek', 'murphy', 'elflord', 'pablo', 'koehler']  " colorscheme names that we use to set color

let s:mycolors = ['3dglasses', 'Benokai', 'BlackSea', 'C64', 'CandyPaper', 'Chasing_Logic', 'ChocolateLiquor', 'ChocolatePapaya', 'CodeFactoryv3', 'DevC++', 'Dev_Delight', 'Monokai', 'MountainDew', 'OceanicNext', 'PapayaWhip', 'PaperColor', 'Revolution', 'SlateDark', 'Spink', 'SweetCandy', 'Tomorrow-Night-Blue', 'Tomorrow-Night-Bright', 'Tomorrow-Night-Eighties', 'Tomorrow-Night', 'Tomorrow', 'VIvid', 'abbott', 'abra', 'adam', 'adaryn', 'adobe', 'adrian', 'advantage', 'af', 'aiseered', 'alduin', 'anderson', 'anotherdark', 'ansi_blows', 'antares', 'apprentice', 'aqua', 'argonaut', 'ashen', 'asmanian_blood', 'astronaut', 'asu1dark', 'atom', 'automation', 'autumn', 'autumnleaf', 'babymate256', 'badwolf', 'base', 'base16-ateliercave', 'base16-atelierdune', 'base16-atelierestuary', 'base16-atelierforest', 'base16-atelierheath', 'base16-atelierlakeside', 'base16-atelierplateau', 'base16-ateliersavanna', 'base16-atelierseaside', 'base16-ateliersulphurpool', 'base16-railscasts', 'basic', 'bayQua', 'baycomb', 'bclear', 'beachcomber', 'beauty256', 'beekai', 'behelit', 'benlight', 'bensday', 'billw', 'biogoo', 'birds-of-paradise', 'black_angus', 'blackbeauty', 'blackboard', 'blackdust', 'blacklight', 'blazer', 'blink', 'blue', 'bluechia', 'bluedrake', 'bluegreen', 'blueprint', 'blueshift', 'bluez', 'blugrine', 'bmichaelsen', 'bocau', 'bog', 'borland', 'breeze', 'brogrammer', 'brookstream', 'brown', 'bubblegum-256-dark', 'bubblegum-256-light', 'bubblegum', 'buddy', 'burnttoast256', 'busierbee', 'busybee', 'buttercream', 'bvemu', 'bw', 'c', 'cabin', 'cake', 'cake16', 'calmar256-light', 'camo', 'campfire', 'candy', 'candycode', 'candyman', 'caramel', 'carrot', 'carvedwood', 'carvedwoodcool', 'cascadia', 'cgpro', 'chance-of-storm', 'charged-256', 'charon', 'chela_light', 'chlordane', 'chocolate', 'chrysoprase', 'ciscoacl', 'clarity', 'cleanphp', 'cleanroom', 'clearance', 'cloudy', 'clue', 'cobalt', 'cobalt2', 'cobaltish', 'coda', 'codeblocks_dark', 'codeburn', 'codeschool', 'coffee', 'coldgreen', 'colorer', 'colorful', 'colorful256', 'colorsbox-faff', 'colorsbox-greenish', 'colorsbox-material', 'colorsbox-stblue', 'colorsbox-stbright', 'colorsbox-steighties', 'colorsbox-stnight', 'colorscheme_template', 'colorzone', 'contrasty', 'cool', 'corn', 'corporation', 'crayon', 'cthulhian', 'custom', 'd8g_01', 'd8g_02', 'd8g_03', 'd8g_04', 'dante', 'dark-ruby', 'darkBlue', 'darkZ', 'darkblack', 'darkblue2', 'darkbone', 'darkburn', 'darkdot', 'darkeclipse', 'darker-robin', 'darkerdesert', 'darkocean', 'darkrobot', 'darkslategray', 'darkspectrum', 'darktango', 'darkzen', 'darth', 'dawn', 'deepsea', 'delek', 'delphi', 'denim', 'derefined', 'desert', 'desert256', 'desert256v2', 'desertEx', 'desertedocean', 'desertedoceanburnt', 'desertink', 'detailed', 'devbox-dark-256', 'deveiate', 'developer', 'disciple', 'distinguished', 'django', 'donbass', 'doorhinge', 'doriath', 'dual', 'dull', 'duotone-dark', 'duotone-darkcave', 'duotone-darkdesert', 'duotone-darkearth', 'duotone-darkforest', 'duotone-darkheath', 'duotone-darklake', 'duotone-darkmeadow', 'duotone-darkpark', 'duotone-darkpool', 'duotone-darksea', 'duotone-darkspace', 'dusk', 'earendel', 'earth', 'earthburn', 'eclipse', 'eclm_wombat', 'ecostation', 'editplus', 'edo_sea', 'ego', 'ekinivim', 'ekvoli', 'elda', 'elise', 'elisex', 'elrodeo', 'elrond', 'emacs', 'enigma', 'enzyme', 'erez', 'eva', 'eva01', 'evening', 'evening_2', 'evolution', 'far', 'felipec', 'feral', 'fine_blue', 'flatcolor', 'flatland', 'flatlandia', 'flattened_dark', 'flattened_light', 'flattown', 'flattr', 'flatui', 'fnaqevan', 'fog', 'fokus', 'forneus', 'freya', 'frood', 'frozen', 'fruidle', 'fruit', 'fruity', 'fu', 'fx', 'gardener', 'gemcolors', 'genericdc-light', 'genericdc', 'gentooish', 'getafe', 'getfresh', 'github', 'gobo', 'golded', 'golden', 'google', 'gor', 'gotham', 'gotham256', 'gothic', 'grape', 'gravity', 'graywh', 'grb256', 'greens', 'greenvision', 'grey2', 'greyblue', 'grishin', 'gruvbox', 'gryffin', 'guardian', 'guepardo', 'h80', 'habiLight', 'harlequin', 'heliotrope', 'hemisu', 'herald', 'heroku-terminal', 'heroku', 'herokudoc-gvim', 'herokudoc', 'hilal', 'holokai', 'hornet', 'hotpot', 'hybrid-light', 'hybrid', 'hybrid_material', 'hybrid_reverse', 'iangenzo', 'ibmedit', 'icansee', 'iceberg', 'impact', 'impactG', 'impactjs', 'industrial', 'industry', 'ingretu', 'inkpot', 'inori', 'ir_black', 'ironman', 'itg_flat', 'jaime', 'jammy', 'janah', 'jelleybeans', 'jellybeans', 'jellyx', 'jhdark', 'jhlight', 'jiks', 'kalahari', 'kalisi', 'kalt', 'kaltex', 'kate', 'kellys', 'khaki', 'kib_darktango', 'kib_plastic', 'kiss', 'kkruby', 'kolor', 'kruby', 'kyle', 'laederon', 'landscape', 'lapis256', 'last256', 'late_evening', 'lazarus', 'legiblelight', 'leglight2', 'leo', 'less', 'lettuce', 'leya', 'lightcolors', 'lightning', 'lilac', 'lilydjwg_dark', 'lilydjwg_green', 'lilypink', 'lingodirector', 'liquidcarbon', 'literal_tango', 'lizard', 'lizard256', 'lodestone', 'loogica', 'louver', 'lucid', 'lucius', 'luinnar', 'lumberjack', 'luna-term', 'luna', 'lxvc', 'mac_classic', 'made_of_code', 'madeofcode', 'magicwb', 'mango', 'manuscript', 'manxome', 'marklar', 'maroloccio', 'mars', 'martin_krischik', 'material-theme', 'material', 'materialbox', 'materialtheme', 'matrix', 'maui', 'mayansmoke', 'mdark', 'mellow', 'meta5', 'metacosm', 'midnight', 'midnight2', 'miko', 'mint', 'mizore', 'mod8', 'mod_tcsoft', 'mojave', 'molokai', 'molokai_dark', 'monoacc', 'monochrome', 'monokai-chris', 'monokain', 'montz', 'moonshine', 'moonshine_lowcontrast', 'mophiaDark', 'mophiaSmoke', 'mopkai', 'moria', 'moss', 'motus', 'mrkn256', 'mrpink', 'mud', 'muon', 'mushroom', 'mustang', 'native', 'nature', 'navajo-night', 'navajo', 'nazca', 'nedit', 'nedit2', 'nefertiti', 'neon', 'neonwave', 'nerv-ous', 'neutron', 'neverland-darker', 'neverland', 'neverland2-darker', 'neverland2', 'neverness', 'nevfn', 'newspaper', 'newsprint', 'nicotine', 'night', 'nightVision', 'night_vision', 'nightflight', 'nightflight2', 'nightshimmer', 'nightsky', 'nightwish', 'no_quarter', 'northland', 'northsky', 'norwaytoday', 'nour', 'nuvola', 'obsidian', 'obsidian2', 'oceanblack', 'oceanblack256', 'oceandeep', 'oceanlight', 'olive', 'onedark', 'orange', 'osx_like', 'otaku', 'oxeded', 'pacific', 'paintbox', 'parsec', 'peaksea', 'pencil', 'penultimate', 'peppers', 'perfect', 'pf_earth', 'phd', 'phoenix', 'phphaxor', 'phpx', 'pic', 'pink', 'playroom', 'pleasant', 'potts', 'predawn', 'preto', 'pride', 'primary', 'print_bw', 'prmths', 'professional', 'proton', 'pspad', 'psql', 'pt_black', 'putty', 'pw', 'pyte', 'python', 'quagmire', 'radicalgoodspeed', 'railscasts', 'railscasts_tweaked', 'rainbow_fine_blue', 'rainbow_fruit', 'rainbow_neon', 'rakr-light', 'random', 'rastafari', 'rcg_gui', 'rcg_term', 'rdark-terminal', 'rdark', 'redblack', 'redstring', 'refactor', 'relaxedgreen', 'reliable', 'reloaded', 'revolutions', 'robinhood', 'rootwater', 'rtl', 'sand', 'sandydune', 'satori', 'saturn', 'scala', 'scheakur', 'scite', 'scooby', 'sea', 'sean', 'seashell', 'selenitic', 'seoul', 'seoul256-light', 'seoul256', 'seti', 'settlemyer', 'sexy-railscasts', 'sf', 'shades-of-teal', 'shadesofamber', 'shobogenzo', 'sienna', 'sierra', 'sift', 'silent', 'simple256', 'simple_b', 'simpleandfriendly', 'simplewhite', 'simplon', 'skittles_berry', 'skittles_dark', 'sky', 'smp', 'smpl', 'smyck', 'soda', 'softblue', 'softbluev2', 'softlight', 'sol-term', 'sol', 'solarized', 'sole', 'sonofobsidian', 'sonoma', 'sorcerer', 'soso', 'sourcerer', 'southernlights', 'southwest-fog', 'spacegray', 'spectro', 'spiderhawk', 'spring', 'sprinkles', 'stackoverflow', 'stingray', 'stonewashed-256', 'stonewashed-gui', 'strange', 'strawimodo', 'summerfruit', 'summerfruit256', 'sunburst', 'surveyor', 'swamplight', 'sweater', 'symfony', 'synic', 'tabula', 'tango-desert', 'tango-morning', 'tango', 'tango2', 'tangoX', 'tangoshady', 'taqua', 'tayra', 'tchaba', 'tchaba2', 'tcsoft', 'telstar', 'termschool', 'tesla', 'tetragrammaton', 'textmate16', 'thegoodluck', 'thestars', 'thor', 'thornbird', 'tibet', 'tidy', 'tir_black', 'tolerable', 'tomatosoup', 'tony_light', 'toothpik', 'torte', 'transparent', 'triplejelly', 'trivial256', 'trogdor', 'tropikos', 'turbo', 'tutticolori', 'twilight', 'twilight256', 'twitchy', 'two2tango', 'ubaryd', 'ubloh', 'umber-green', 'understated', 'underwater-mod', 'underwater', 'up', 'valloric', 'vanzan_color', 'vc', 'vcbc', 'vexorian', 'vibrantink', 'vilight', 'vimbrant', 'visualstudio', 'vividchalk', 'vj', 'void', 'vydark', 'vylight', 'wargrey', 'warm_grey', 'wasabi256', 'watermark', 'wellsokai', 'whitebox', 'whitedust', 'widower', 'win9xblueback', 'winter', 'wintersday', 'woju', 'wolfpack', 'wombat', 'wombat256', 'wombat256i', 'wombat256mod', 'wood', 'wuye', 'xemacs', 'xian', 'xmaslights', 'xoria256', 'xterm16', 'yaml', 'yeller', 'zazen', 'zen', 'zenburn', 'zenesque', 'zephyr', 'zmrok', 'znake']

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  " if len(a:args) == 0
  if true
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    " let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let paths = split(globpath('/Volumes/data/git/holistic-vim-tmux/bundle/vim-colorschemes', 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction
