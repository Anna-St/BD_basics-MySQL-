# Блок 1. База данных «Страны и города мира»:
USE geodata;
# 1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
SELECT _regions.title_ru, _countries.title_ru, _cities.title_ru
FROM _cities
LEFT JOIN _regions ON _cities.region_id = _regions.region_id
LEFT JOIN _countries ON _cities.country_id = _countries.country_id
WHERE _cities.title_ru = 'Сыктывкар'

# 2. Выбрать все города из Московской области.   
SELECT title_ru, city_id FROM _cities WHERE region_id = (SELECT region_id FROM _regions WHERE title_ru = 'Московская область')




