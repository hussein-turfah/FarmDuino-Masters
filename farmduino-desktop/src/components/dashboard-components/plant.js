import { useEffect, useState } from "react";
import { Container_title, Myboxnologo, Page_Content_Container } from "../general-components/general";
import styles from "./plant.module.css";
import UseHttp from "../../hooks/http-request";

const logo = process.env.PUBLIC_URL + "assets/icons/artificial-intelligence.png";

export const Plant = (props) => {
  const [aiData, setAIData] = useState([]);
  const [ideal_conditions, setIdealConditions] = useState([]);
  const [plant_image, setPlantImage] = useState("")

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await UseHttp("ai","GET","",{Authorization: "bearer"+ localStorage.getItem("token")});
        setAIData(data);
        setIdealConditions(data.ideal_conditions);
      } catch(error) {
        console.log(error);
      }
    };
    fetchData();
  }, []);

  useEffect(() => {
    const fetchImage = async () => {
      try {
        const image = await UseHttp("plant-image","GET","",{Authorization: "bearer"+ localStorage.getItem("token")});
        setPlantImage(image.image_url);
      } catch(error) {
        console.log(error);
      }
    };
    fetchImage();
  }, []);

  return (
    <div className={styles.plant_body}>
      <div className={styles.container_title}>
        <Container_title title="Ideal Conditions" />
        <div className={styles.container_logo}>
          <img src={logo} className={styles.logo} alt="Logo" />
        </div>
      </div>
      <div className={styles.plant_details_container}>
        <div className={styles.first_row}>
          <div className={styles.plant_image_container}>
            <img src={plant_image} className={styles.plant_image} alt="Plant Image" />
          </div>
          <Myboxnologo
            styles={styles.plant_species} 
            title="Plant Species" 
            value={aiData && aiData.Genus_species ? aiData.Genus_species : ""}
          />
        </div>
        <div className={styles.second_row}>
          <Myboxnologo styles={styles.ai_readings} title="Temperature" value={ideal_conditions.temperature || ""} />
          <Myboxnologo styles={styles.ai_readings} title="Humidity" value={ideal_conditions.humidity || ""} />
        </div>
        <div className={styles.second_row}>
          <Myboxnologo styles={styles.ai_readings} title="Soil Moisture" value={ideal_conditions.soil_moisture || ""} />
          <Myboxnologo styles={styles.ai_readings} title="Light Intensity" value={ideal_conditions.light_intensity || ""} />
        </div>
      </div>
    </div>
  );
};

export const Plant_row = (props) => {
  const [plant_image, setPlantImage] = useState("")

  useEffect(() => {
    const fetchImage = async () => {
      try {
        const image = await UseHttp("plant-image","GET","",{Authorization: "bearer"+ localStorage.getItem("token")});
        setPlantImage(image.image_url)
      } catch(error) {
        console.log(error)
      }
    }
    fetchImage();
  }, []);

  return (
    <div className={styles.row_plant_body}>
      <div className={styles.container_title}>
        <Container_title title="Ideal Conditions" />
        <div className={styles.container_logo}>
          <img src={logo} className={styles.logo} alt="Logo" />
        </div>
      </div>
      <div className={styles.row_plant_details_container}>
      <div className={styles.row_first_row}>
        <div className={styles.row_plant_image_container}>
          <img src={plant_image} className={styles.plant_image} alt="Plant Image" />
        </div>
       <Myboxnologo styles={styles.row_plant_species} 
       title="Plant Species" value={props.genus_species || ""}/>
      </div>
      <div className={styles.row_second_row}>
        <Myboxnologo styles={styles.row_ai_readings} title={props.condition_title || ""} value={props.condition || ""} />
        <Myboxnologo styles={styles.row_ai_sentence} title="Explanation" value={props.sentence || ""} />
      </div>
    </div>
    </div>
  );
};
