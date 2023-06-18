-- mode symbols
vim.g.airline_mode_map = {
    ['__'] = '-',
    ['c'] = 'C',
    ['i'] = 'I',
    ['ic'] = 'I',
    ['ix'] = 'I',
    ['n'] = 'N',
    ['multi'] = 'M',
    ['ni'] = 'N',
    ['no'] = 'N',
    ['R'] = 'R',
    ['Rv'] = 'R',
    ['s'] = 'S',
    ['S'] = 'S',
    [''] = 'S',
    ['t'] = 'T',
    ['v'] = 'V',
    ['V'] = 'VL',
    [''] = 'VB',
}

-- expected encoding/line ending
vim.g['airline#parts#ffenc#skip_expected_string'] = 'utf-8[unix]'

-- symbols
vim.g.airline_symbols = {
    branch = '',
    colnr = ' C:',
    readonly = '',
    linenr = ' L:',
    maxlinenr = '',
    notexists = ' ',
    dirty = '!',
    keymap = 'Keymap:',
    crypt = '🔒',
    spell = 'SPELL',
    space = ' ',
    whitespace = '☲',
    modified = '+',
    ellipsis = '...',
    paste = 'PASTE'
}

-- separators
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
