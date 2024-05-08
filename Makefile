.PHONY : all
all : data/housing_census.csv data/movement_to_date.csv

new_arrivals.xlsx :
	wget -O $@ "https://docs.google.com/spreadsheets/u/1/d/e/2PACX-1vS1mJPaYOGURV6AjYOMEAAS03vAa3ZUpgKeS8UJHV_3xcx141VSTX3MRnHXp_Y7TeD9jFJF4iCHjXYI/pub?output=xlsx"

data/housing_census.csv : new_arrivals.xlsx
	in2csv --sheet Census $< > $@

data/movement_to_date.csv :
	wget -O $@ "https://docs.google.com/spreadsheets/d/e/2PACX-1vS1mJPaYOGURV6AjYOMEAAS03vAa3ZUpgKeS8UJHV_3xcx141VSTX3MRnHXp_Y7TeD9jFJF4iCHjXYI/pub?output=csv&gid=1910089974"
