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

# List all available services in a docker-compose.yml file.
function __fish_docker_compose_all_services --description "List all services in docker-compose.yml"
    set -l path (pwd)
    while not test -e $path/docker-compose.yml
        set path $path/..
    end
    cat $path/docker-compose.yml | command grep '^[a-zA-Z]' | command sed 's/://'
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

# docker-compose commands that take services
complete -c docker-compose -f -n '__fish_docker_using_command build' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command kill' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command logs' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command port' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command ps' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command pull' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command restart' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command rm' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command run' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command scale' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command start' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command stop' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"
complete -c docker-compose -f -n '__fish_docker_using_command up' -a '(__fish_docker_compose_all_services)' --description "Docker compose service"

