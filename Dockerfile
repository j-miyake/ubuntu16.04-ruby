FROM ubuntu:16.04
ARG RUBY_PATH=/usr/local/
ARG RUBY_VERSION=2.6.6

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       curl \
                       git \
                       less \
                       tzdata \
                       locales \
                       libssl-dev \
                       libreadline-dev \
                       libxml2-dev \
                       libxslt-dev \
                       libcurl4-openssl-dev \
                       libmysqlclient-dev

RUN git clone git://github.com/rbenv/ruby-build.git $RUBY_PATH/plugins/ruby-build && \
    $RUBY_PATH/plugins/ruby-build/install.sh
RUN ruby-build $RUBY_VERSION $RUBY_PATH
CMD [ "irb" ]
