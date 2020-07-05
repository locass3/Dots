#Docker Aliases

alias dshell="docker run --rm -it -v /home/locass03/shared:/root/shared"
alias dkeep="docker run -it -v /home/locass03/shared:/root/shared"

function dockershellhere() {
    dirname=${PWD##*/}
    docker run --rm -it -v `pwd`:/${dirname} -w /${dirname} "$@"
}
function dockershellshhere() {
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${dirname} "$@"
}

alias impacket="docker run --rm -it rflathers/impacket"

smbservehere() {
    local sharename
    [[ -z $1 ]] && sharename="SHARE" || sharename=$1
    docker run --rm -it -p 445:445 -v "${PWD}:/tmp/serve" rflathers/impacket smbserver.py -smb2support $sharename /tmp/serve
}

#Single Commands

alias recon="docker run --rm -it -v /home/locass03/shared:/root/shared recon"
alias webhere='docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/srv/data" rflathers/nginxserve'
alias webshare='docker run --rm -it -p 80:80 -p 443:443 -v "home/locass03/shared:/srv/data" rflathers/nginxserve'
alias msfvenomhere='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -v "${PWD}:/data" msf ./msfvenom'


