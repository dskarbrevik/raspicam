while true
do
	gst-launch-1.0 libcamerasrc ! video/x-raw,width=640,height=480,framerate=30/1,format=I420 ! videoconvert ! v4l2h264enc extra-controls="controls,repeat_sequence_header=1" ! video/x-h264,level='(string)4' ! h264parse ! video/x-h264,stream-format=avc, alignment=au,width=640,height=480,framerate=30/1 ! kvssink stream-name=$AWS_KVS_STREAM_NAME access-key=$AWS_ACCESS_KEY_ID secret-key=$AWS_SECRET_ACCESS_KEY aws-region=$AWS_DEFAULT_REGION
	sleep 1
done
