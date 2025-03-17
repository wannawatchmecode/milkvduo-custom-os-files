#EXISTING_IP=$(ifconfig usb0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')  


THIRD_SUBNET=42
#$((1 + $RANDOM % 255))
NEW_IP_LAST_SUBNET=$((1 + $RANDOM % 255))
IP="192.168.$THIRD_SUBNET.$NEW_IP_LAST_SUBNET"
OVERRIDE_PATH=/etc/overrides
if test -f "${OVERRIDE_PATH}/ip_override.txt"; then
	          echo "${OVERRIDE_PATH}/ip_override.txt file exists."
		          IP=$(cat "${OVERRIDE_PATH}/ip_override.txt")
			    else
				              echo "${OVERRIDE_PATH}/ip_override.txt file does not exist"
					                echo "Using ip ${IP} and writing to ${OVERRIDE_PATH}/ip_override.txt"
							          mkdir -p ${OVERRIDE_PATH}/
								            echo "$IP" > ${OVERRIDE_PATH}/ip_override.txt
fi




echo "Using ip ${IP} ..."

#if [ $EXISTING_IP != 127.168.42.1 ] ;then
#	        echo "IP has already been updated to non default of $EXISTING_IP ..."
#		        echo "Skipping setip init script"
#			
#fi

