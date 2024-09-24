function execute
    if test (count $argv) -ne 2
        echo "Use: execute <command> <dir>"
        return 1
    end

    # get the command and dir from arguments
    set command $argv[1]
    set dir $argv[2]

    # check if dir exists
    if not test -d $dir
        echo "execute: no such directory $dir"
        return 1
    end

    for file in $dir/*
        eval $command $file
    end
end