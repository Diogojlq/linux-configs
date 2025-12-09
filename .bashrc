export GEMINI_API_KEY="AIzaSyBD3XkiaTo2x8P2sEVZWchXgkgCBUSUFNA"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"

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
alias ai-instructions='echo -e "# AI Instructions\n\nAlways write code and documentation in English.\nDo not include comments in the code unless explicitly requested." > ai-instructions.md'
alias walkercss='cd ~/.config/omarchy/themes/matte-black && nvim walker.css'
alias windows='cd ~/.local/share/omarchy/default/hypr/ && nvim windows.conf'
alias screensaver='cd ~/.config/omarchy/branding && nvim screensaver.txt'
alias logo='cd /usr/share/plymouth/themes/omarchy'
alias p='cd ~/Projects/'

alias django='python manage.py runserver'
alias server='ssh dio@192.168.10.4'

alias conventions='cat ~/notes/conventional-commits.txt'
alias rmcommit='git reset --soft HEAD~1'


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

cdd() {
    cd "$@" && 
    echo "Just a sec..."
    code . & disown
}

nb() {
    if [ -z "$*" ]; then
      echo "Write a message :)"
        return 1
    fi

    git branch "$*" && git switch "$*"
}


source /home/diogo/.config/broot/launcher/bash/br
