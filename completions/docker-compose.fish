#
# Completions for docker-compose
#

function __fish_docker_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_docker_compose_file_path --description \
        'Get the next docker-compose.yml file in the folder parent path.'
    set -l path (pwd)
    while not test -e $path/docker-compose.yml
        if test $path = '/'
            return
        end

        set path (realpath $path/..)
    end

    echo $path/docker-compose.yml
end

function __fish_docker_compose_file_version --description \
        'Get the version of a docker-compose.yml file.'
    cat (__fish_docker_compose_file_path) \
        | command grep '^version:\(\s*\)["\']\?[0-9]["\']\?' \
        | command grep -o '[0-9]'

    if test $status -ne 0
        echo '1'
    end
end

function __fish_docker_compose_all_services --description \
        'List all services in docker-compose.yml.'
    set -l path (__fish_docker_compose_file_path)
    set -l file_version (__fish_docker_compose_file_version)

    switch $file_version
        case '2'
            # TODO: currently this only finds services that are indented with
            # 2 spaces. Make it work with any indentation.
            cat $path | command sed -n '/^services:/,/^\w/p' \
                | command grep '^  \w' | command sed 's/\s\|://g'
        case '1'
            cat $path | command grep '^[a-zA-Z]' | command sed 's/://'
    end
end

# All docker-compose commands
complete -c docker-compose -n '__fish_use_subcommand' -xa build              --description "Build or rebuild services"
complete -c docker-compose -n '__fish_use_subcommand' -xa help               --description "Get help on a command"
complete -c docker-compose -n '__fish_use_subcommand' -xa kill               --description "Kill containers"
complete -c docker-compose -n '__fish_use_subcommand' -xa logs               --description "View output from containers"
complete -c docker-compose -n '__fish_use_subcommand' -xa port               --description "Print the public port for a port binding"
complete -c docker-compose -n '__fish_use_subcommand' -xa ps                 --description "List containers"
complete -c docker-compose -n '__fish_use_subcommand' -xa pull               --description "Pulls service images"
complete -c docker-compose -n '__fish_use_subcommand' -xa restart            --description "Restart services"
complete -c docker-compose -n '__fish_use_subcommand' -xa rm                 --description "Remove stopped containers"
complete -c docker-compose -n '__fish_use_subcommand' -xa run                --description "Run a one-off command"
complete -c docker-compose -n '__fish_use_subcommand' -xa scale              --description "Set number of containers for a service"
complete -c docker-compose -n '__fish_use_subcommand' -xa start              --description "Start services"
complete -c docker-compose -n '__fish_use_subcommand' -xa stop               --description "Stop services"
complete -c docker-compose -n '__fish_use_subcommand' -xa up                 --description "Create and start containers"
complete -c docker-compose -n '__fish_use_subcommand' -xa migrate-to-labels  --description "Recreate containers to add labels"
complete -c docker-compose -n '__fish_use_subcommand' -xa version            --description "Show the Docker-Compose version information"
complete -c docker-compose -n '__fish_use_subcommand' -xa create             --description "Create containers without starting them"
complete -c docker-compose -n '__fish_use_subcommand' -xa config             --description "Validate and print compose configuration"
complete -c docker-compose -n '__fish_use_subcommand' -xa down               --description "Stop and remove all container resources"
complete -c docker-compose -n '__fish_use_subcommand' -xa events             --description "Monitor events from containers"

# docker-compose commands that take services
for subcmd in build create down kill logs port ps pull restart rm run scale \
        start stop up
    complete -c docker-compose -f -n "__fish_docker_using_command $subcmd" \
        -a '(__fish_docker_compose_all_services)' \
        --description "Docker compose service"
end
