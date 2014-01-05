#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias packer-color='sudo packer-color'
alias setpython='sudo setpython'

source /usr/share/git/completion/git-completion.bash


PATH=$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/home/roach/bin
PATH=$PATH:/home/roach/ingress-apk-mod/bin:/opt/android-sdk/build-tools/19

# Pacman alias examples
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

sshkey() {
   eval `ssh-agent`
   ssh-add
}

cache() {
   watch -n .5 --color /home/roach/bin/_ccache
}

prefix() {
   export WINEPREFIX="$HOME/.local/share/wineprefixes/$1"
}

goc() {
   cd $WINEPREFIX/drive_c
}

lsp() {
   ls $* $HOME/.local/share/wineprefixes
}

run() {
   prefix $1
   goc
   wine cmd /c run-$1.bat
}

run32() {
   prefix $1
   export WINEARCH="win32"
   goc
   wine cmd /c run-$1.bat
}

depot_tools() {
   export PATH="$PATH":$HOME/depot_tools
   export BOARD=x86-generic
}

botch() {
    while true; do
        (echo -en '\033[H'
            CMD="$@"
            bash -c "$CMD" | while read LINE; do 
                echo -n "$LINE"
                echo -e '\033[0K' 
            done
            echo -en '\033[J') | tac | tac 
        sleep 10
    done
}

archey
