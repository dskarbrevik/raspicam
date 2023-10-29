# designed for armv7l - raspberry pi os (bullseye)... 

sudo apt update
sudo apt install -y \
  automake \
  build-essential \
  cmake \
  git \
  gstreamer1.0-plugins-base-apps \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-tools \
  gstreamer1.0-omx-generic \
  libcurl4-openssl-dev \
  libgstreamer1.0-dev \
  libgstreamer-plugins-base1.0-dev \
  liblog4cplus-dev \
  libssl-dev \
  pkg-config \
  openjdk-8-jdk

echo 'export JAVA_HOME=/usr/lib/java_open' >> ~/.bashrc

sudo curl https://www.amazontrust.com/repository/AmazonRootCA1.pem -o /etc/ssl/AmazonRootCA1.pem
sudo chmod 644 /etc/ssl/AmazonRootCA1.pem

git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git

mkdir -p amazon-kinesis-video-streams-producer-sdk-cpp/build
cd amazon-kinesis-video-streams-producer-sdk-cpp/build

cmake .. -DBUILD_GSTREAMER_PLUGIN=ON -DBUILD_DEPENDENCIES=FALSE -DBUILD_JNI=TRUE
make

echo 'export GST_PLUGIN_PATH=/home/pi/amazon-kinesis-video-streams-producer-sdk-cpp/build' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/home/pi/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib' >> ~/.bashrc
