#/bin/sh

echo "DayOne File Importer."

command -v dayone >/dev/null 2>&1 || { echo "Please install the dayone command line tools to use this script." >&2; exit 1; }

PARAM1="$1"

if [ "$PARAM1" = "" ]; then
   echo "Please specify the file mask. i.e. *.txt";
   exit 1;
fi

echo "Importing $1";

for filename in $1; do
      echo "file: $filename";
      dt="$(stat -f '%Sm' -t '%m/%d/%Y %H:%M%p' $filename)";
      echo "date:$dt";
      dayone -d="$dt" new < $filename;
done
