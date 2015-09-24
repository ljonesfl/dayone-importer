#/bin/sh

#

echo "DayOne File Importer."

# check if dayone is installed..
command -v dayone >/dev/null 2>&1 || { echo "Please install the dayone command line tools to use this script." >&2; exit 1; }


# check for file mask parameter..
PARAM1="$1"

if [ "$PARAM1" = "" ]; then
   echo "Usage:\n"
   echo "\tdayone-importer \"*.txt\""
   exit 1;
fi

echo "Importing $1";

# bulk import files..
for file in $1; do
      # printf -v file "%q" $filename
      echo "file: $file";
      dt="$(stat -f '%Sm' -t '%m/%d/%Y %H:%M%p' ${file})";
      echo "date:$dt";
      # dayone -d="$dt" new < $filename;
done
