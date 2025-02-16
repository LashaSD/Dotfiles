return {
    "bbjornstad/pretty-fold.nvim",
    config = function()
        require('pretty-fold').setup({
            fill_char = ' ',
            stop_words = {},
            sections = {
                left = { 'content' },
                right = {}
            },
            matchup_patterns = {
                { '^%s*do$', 'end' }, -- `do ... end` blocks
                { '^%s*if', 'end' },

                { '^%s*for', 'end' },

                { 'function%s*%(', 'end' }, -- 'function(' or 'function ('

                {  '{', '}' },
                { '%(', ')' }, -- % to escape lua pattern char
                { '%[', ']' }, -- % to escape lua pattern char
            },
        });
    end
}
