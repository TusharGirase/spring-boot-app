major_version=$1
nexus_server=$2
nexus_repo=$3
artifact_id=$(echo $4 | sed 's/\./\//g')
#echo "$4"
#echo "${artifact_id}"
#echo "${nexus_server}/repository/${nexus_repo}/${artifact_id}/maven-metadata.xml"

last_build_number=$(wget -q -O- "${nexus_server}/repository/${nexus_repo}/${artifact_id}/maven-metadata.xml" | grep -i '</version>' | grep -i ${major_version} | cut -d'-' -f2 | cut -d'<' -f1 | sort -n | tail -n 1 | tr '\n' ' ')
#echo "last build number ${last_build_number}"
if [ -z "${last_build_number}" ]
then
	new_build_number=$(printf $((0)))
else
	new_build_number=$(printf $(($last_build_number+1)))
fi
#echo "$new_build_number"

new_version="${major_version}-${new_build_number}"

echo "${new_version}"