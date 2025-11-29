# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias branch='git branch'
alias keybinds='cd ~/.config/hypr && nvim bindings.conf'
alias bashrc='cd ~/ && nvim .bashrc'
alias wallpaper='cd ~/.config/omarchy/themes/matte-black/backgrounds'
alias mine='java -jar ~/Games/TLauncher.jar'
alias lock='faillock --reset'
alias waybarcolors='cd ~/.config/omarchy/current/theme && nvim waybar.css'
alias looknfeel='cd ~/.config/hypr && nvim looknfeel.conf'


alias eyes='cat ~/ascii_stickers/eyes.txt'
alias demon='cat ~/ascii_stickers/demon.txt'
alias death='cat ~/ascii_stickers/death.txt'
alias doit='cat ~/ascii_stickers/doit.txt'
alias fish='cat ~/ascii_stickers/fish.txt'
alias anger='cat ~/ascii_stickers/anger.txt'
alias arch='cat ~/ascii_stickers/arch.txt'
alias face='cat ~/ascii_stickers/face.txt'
alias nyan='cat ~/ascii_stickers/nyan.txt'

alias backup='sh ~/backup.sh'

alias cmd='cd ~/.config/ghostty/ && nvim config'
alias atv='source .venv/bin/activate'

#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"
# Mostrar branch Git no prompt
unset PROMPT_COMMAND
parse_git_branch() {
  git branch 2>/dev/null | grep '*' | sed 's/* //'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(git branch --show-current 2>/dev/null)\[\e[00m\]\n> "

commit() {
    if [ -z "$*" ]; then
      echo "Write a message :)"
        return 1
    fi

    git commit -m "$*"
}

dev() {
    workspace1 && workspace2 && workspace5
    exit
}

workspace1() {
    hyprctl dispatch workspace 1
    exec "ghostty --directory ~/Projects"
}

workspace2() {
    hyprctl dispatch workspace 2
    nohup omarchy-launch-webapp "https://github.com" &&  brave
}

workspace5() {
    hyprctl dispatch workspace 5
    nohup omarchy-launch-webapp "https://gemini.google.com/app?hl=en" && spotify
}

cdd() {
    cd "$@" && 
    echo "Just a sec..."
    code . & disown
}