cd ~

set -x -g PATH $PATH "/Library/Frameworks/Python.framework/Versions/3.6/bin"
set -x -g PATH $PATH "/anaconda3/bin"

source /anaconda3/etc/fish/conf.d/conda.fish

function ll
	colorls -la $argv
end

function l
	colorls $argv
end

function lt
    colorls --tree $argv
end

function arch
	ssh graham@127.0.0.1 -p 3022
end

function home
	cd ~
end

function ls
    colorls
end

function fish_prompt
	set -l __last_command_exit_status $status

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l light_blue (set_color 5EAFF2)
    set -l normal (set_color normal)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow "$arrow_color➜ "
    if test "$USER" = 'root'
        set arrow "$arrow_color# "
    end

    set -l cwd $light_blue(basename (prompt_pwd))

    echo -n -s $arrow $cwd $repo_info $blue ' $ '

end
