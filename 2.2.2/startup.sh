#!/bin/bash
if [ "$#" -ne 0 ]
then
  cmd="$@"
  echo "custom startup command found: $cmd"
  if [[ "$cmd" == dotnet*.dll* ]]
  then
    for word in "$cmd"
    do
      if [[ "$word" == *.dll ]]
      then
        echo "found .dll in argument: $word"
        if [ -f "$word" ]
        then
          exec "$@"
        else
          echo "file $word does not exist"
          exit
        fi
      fi
    done
  fi
fi
