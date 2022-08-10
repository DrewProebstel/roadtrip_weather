<h2> Installation </h2>
<ol>
<li> Clone This repository </li>
<li> Run $bundle install </li>
<li> Get API key from https://developer.mapquest.com/documentation/geocoding-api/ </li>
<li> Get API key from https://openweathermap.org/api </li>
<li> Navigate to the config directory and create an application.yml file </li>
<li> Fill in the file as show 

```
weather_api_key: "YOUR KEY"
map_quest_api_key: "YOUR KEY"
```
<li> Run $rails db:{create,migrate} </li>
  
<h2> End Points </h2>
  
  ```
  GET /api/v1/forecast?location=denver,Co
  ```
  response
  ```
  {
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
