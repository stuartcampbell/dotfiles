alias webcam_fix="ffmpeg -an -f video4linux2 -video_size 640x480 -vcodec mjpeg -i /dev/video0 -input_format mjpeg -f v4l2  -pix_fmt yuv420p /dev/video1"

