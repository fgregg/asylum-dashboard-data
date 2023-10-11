.PHONY : all
all : data/housing_locations.csv data/counts_by_housing.csv data/census.csv

data/housing_locations.csv :
	python scripts/fetch.py https://airtable.com/appO5SjrHmmAvfP27/shrYnsCb5j4NnoWTG/tblgI0KbgdTmF2YkJ > $@

data/counts_by_housing.csv :
	python scripts/fetch.py https://airtable.com/appO5SjrHmmAvfP27/shrYnsCb5j4NnoWTG/tblgI0KbgdTmF2YkJ > $@

data/census.csv :
	python scripts/fetch.py https://airtable.com/appO5SjrHmmAvfP27/shrY831lrVyARjFXm/tblwMC5zIjt6pINLx > $@
