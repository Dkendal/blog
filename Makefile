define PROGN
(progn
	(package-initialize)
	(require 'ox-hugo)
	(org-hugo-export-wim-to-md :all-subtrees nil nil))
endef

export PROGN

index := content-org/index.org

all: assets/css/heights.css $(index)
	emacs --batch --visit $(index) --eval "$$PROGN" --kill
	rm -f content/**/*.md~
	hugo --cleanDestinationDir

assets/css/heights.css: assets/css/heights.rb
	./assets/css/heights.rb > $@

clean:
	rm ./assets/css/heights.css
