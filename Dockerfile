# 기본 이미지로 ubuntu를 사용합니다.
FROM ubuntu:latest

# 필요한 패키지들을 설치합니다.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y ruby-full build-essential zlib1g-dev

# 로컬 gem 설치를 위한 환경변수 설정
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc && \
    /bin/bash -c "source ~/.bashrc"

# Jekyll과 bundler를 설치합니다.
RUN gem install jekyll bundler

# 앱 코드를 도커 이미지 안에 복사합니다.
# 이를 위해 먼저 앱 코드가 있는 폴더에서 Dockerfile을 실행해야 합니다.
COPY . /app

# 작업 디렉토리 설정
WORKDIR /app

# Jekyll 사이트를 빌드합니다.
RUN bundle install && \
    jekyll build

# Jekyll 서버를 실행합니다.
CMD ["jekyll", "serve", "--host=0.0.0.0"]