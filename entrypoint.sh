#!/bin/bash

# see: https://stackoverflow.com/a/14203146
for i in "$@"; do 
    case $i in
        --pat=*)
        personal_access_token="${i#*=}"
        shift
        ;;

        -*|--*)
        echo "unknown option $i"
        exit 1
        ;;
    *)
    ;;
    esac
done

gh auth login --with-token < <(echo $personal_access_token)

github_user_repositories=$(gh api user/repos --paginate)

# see: https://stackoverflow.com/a/67638584
readarray -t repositories < <(jq --compact-output '.[]' <<< $github_user_repositories)

for repository in "${repositories[@]}"; do
    repository_owner=$(jq --raw-output '.owner.login' <<< $repository)
    repository_name=$(jq --raw-output '.name' <<< $repository)
    repository_full_name=$(jq --raw-output '.full_name' <<< $repository)

    mkdir -p "backup/$repository_owner"

    # clone
    git clone --mirror "https://$personal_access_token@github.com/$repository_full_name.git"

    # bundle
    cd "$repository_name.git"
    git bundle create "../backup/$repository_full_name.bundle" --all
    cd ..

    # cleanup
    rm -rf "$repository_name.git"
done

# move backup dir into volume dir
mv backup /mnt/local
