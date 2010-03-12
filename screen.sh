base="/home/$USER"
orig="$base/.screenrc"

if [[ -z $1 ]]; then
	screen
fi

if [ "$1" == "list" ]; then
	echo "Available screen profiles..."
	cd "$base"
	options=`ls ~/.screenrc.*`
	for opt in $options ; do
		ext=`echo "$opt"|awk -F . '{print $NF}'`
		if [ "${ext#${ext%?}}" != "~" ]; then
			echo $ext
		fi
	done
	exit
fi


#Try to get the profile. If not found, run with given args
use="$orig.$1"
if [ -e "$use" ] ; then
	echo "Using profile from $use..."
	cp -f "$use" "$orig"
	shift
	screen "$@"
	exit
else
	echo "Profile not found at $use. Using last profile..."
	screen "$@"
	exit
fi
