function fuck
    killall -9 $argv[2]
    if test $status = 0
        echo
        echo " (╯°□°）╯︵" (echo $argv[2]|~/.config/fish/functions/flip ^/dev/null)
        echo
    end
end
