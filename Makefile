# Copyright 2019 The Kubernetes Authors.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DBG_MAKEFILE ?=
ifeq ($(DBG_MAKEFILE),1)
    $(warning ***** starting Makefile for goal(s) "$(MAKECMDGOALS)")
    $(warning ***** $(shell date))
else
    # If we're not debugging the Makefile, don't echo recipes.
    MAKEFLAGS += -s
endif

.PHONY: generate docs
generate:
	GO111MODULE=on go generate

.PHONY: run
run:
	GO111MODULE=on go run .

.PHONY: build
build:
	GO111MODULE=on go build .

.PHONY: check
check:
	GO111MODULE=on ./scripts/check-everything.sh

debug:
	GO111MODULE=on dlv debug .

docs:
	cd site && go run github.com/gohugoio/hugo
