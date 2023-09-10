major_version=$2
nexus_server=$3
nexus_repo=$4
artifact_id=$(echo $5 | sed 's/\./\//g')
echo "${artifact_id}"
echo "${nexus_server}/repository/${nexus_repo}/${artifact_id}/maven-metadata.xml"

last_build_number=$(wget -q -O- "${nexus_server}/repository/${nexus_repo}/${artifact_id}/maven-metadata.xml" | grep -i '</version>' | grep -i ${major_version} | cut -d'-' -f2 | cut -d'<' -f1 | sort -n | tail -n 1 | tr '\n' ' ')
echo "last build number ${last_build_number}"
if [ -z "${last_build_number}" ]
then
	new_build_number=$(printf $((0)))
else
	new_build_number=$(printf $(($last_build_number+1)))
fi
echo "new build number is $new_build_number"

new_version="${major_version}-${new_build_number}"

echo "new version is ${new_version}"