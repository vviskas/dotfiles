$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"

#env PATH
$env.PATH = ($env.PATH | prepend '/home/wiskas/.local/bin/')

#Aliases
alias vim = nvim


# Oh My Posh
oh-my-posh init nu --config ~/.poshthemes/dracula.omp.json

# Zoxide
zoxide init nushell | save -f ~/.zoxide
source ~/.zoxide.nu

#Television
mkdir ($nu.data-dir | path join "vendor/autoload")
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
