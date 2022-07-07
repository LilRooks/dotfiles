local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    use 'lifepillar/gruvbox8'
    use 'vim-airline/vim-airline'
    use 'scrooloose/nerdtree'
    use 'ryanoasis/vim-devicons'
    use 'airblade/vim-gitgutter'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
