import Sidebar from '../../components/user-sidebar/sidebar';
import styles from './dashboard.module.css';
import Navbar from '../../components/user-navbar/navbar';
import Ticker from '../../components/ticker/ticker';
import { Page_Title, Mybox, Container_title, My_weather_box } from '../../components/general-components/general';
import React, { useState, useEffect } from 'react';
import { Plant } from '../../components/dashboard-components/plant';
import Actuators from '../../components/dashboard-components/actuators';
import UseHttp from '../../hooks/http-request';

const weather_image = process.env.PUBLIC_URL + 'assets/icons/rect65.png';
const temperature_icon = process.env.PUBLIC_URL + 'assets/icons/temperature.png';
const humidity_icon = process.env.PUBLIC_URL + 'assets/icons/humidity.png';
const soil_moisture_icon = process.env.PUBLIC_URL + 'assets/icons/soil_moisture.png';
const light_intensity_icon = process.env.PUBLIC_URL + 'assets/icons/light_intensity.png';

const Dashboard = () => {
  const [weather, setWeather] = useState([]);
  const [details, setDetails] = useState([]);

  useEffect(() => {
    const fetchGreenhouseDetails = async () => {
      try {
        const response = await UseHttp("user-last-data", "GET", "", { Authorization: "bearer" + localStorage.getItem("token") });
        setDetails(response.data);
      } catch (error) {
        console.log(error);
      }
    };

    fetchGreenhouseDetails();
  }, []);

  useEffect(() => {
    const fetchWeatherData = async () => {
      try {
        const response = await UseHttp("weather", "GET");
        setWeather(response || []);
      } catch (error) {
        console.log(error);
      }
    };

    fetchWeatherData();
  }, []);

  const dates = [];
  for (let i = 0; i < 3; i++) {
    const date = new Date();
    date.setDate(new Date().getDate() + i);
    const weekday = date.toLocaleDateString("en-US", { weekday: "short" });
    const dateString = date.toLocaleDateString("en-US", {
      day: "numeric",
      month: "short",
    });
    dates.push({ date: dateString, weekday: weekday });
  }

  return (
    <div className='body'>
      <Sidebar />
      <div className='main_container'>
        <Navbar />
        <div className='submain_container'>
          <Page_Title title="Dashboard" subtitle="Greenhouse 1" />
          <div className={styles.container1}>
            <Container_title title='Greenhouse Details' />
            <div className={styles.cards_container}>
              <Mybox styles={styles.mybox} title="Temperature" image_source={temperature_icon} value={`${details.temperature} °C`} />
              <Mybox styles={styles.mybox} title="Humidity" image_source={humidity_icon} value={`${details.humidity} %`} />
              <Mybox styles={styles.mybox} title="Soil Moisture" image_source={soil_moisture_icon} value={`${details.soil_moisture} %`} />
              <Mybox styles={styles.mybox} title="Light Intensity" image_source={light_intensity_icon} value={`${details.light_intensity} lx`} />
            </div>
          </div>
          <div className={styles.container2}>
            <div className={styles.actuators}><Actuators /></div>
            <div className={styles.plant}><Plant /></div>
          </div>
          {weather && weather.length > 0 && (
            <div className={styles.container3}>
              <Container_title title='Weather Forecast' />
              <div className={styles.weather_cards_container}>
                {weather.map((day, index) => (
                  <My_weather_box
                    key={index}
                    date={`${dates[index].weekday} ${dates[index].date}`}
                    image_source={weather_image}
                    temperature={"Temperature"}
                    temp_value={`${day.temperature}°C`}
                    humidity={"Humidity"}
                    humidity_value={`${day.humidity}%`}
                    description={"Description"}
                    desc_value={day.description.charAt(0).toUpperCase() + day.description.slice(1)}
                    wind_speed={"Wind speed"}
                    wind_speed_value={`${day.wind_speed}Km/h`}
                  />
                ))}
              </div>
            </div>
          )}
        </div>
        <Ticker />
      </div>
    </div>
  );
};

export default Dashboard;
