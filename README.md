# Uber Data Analysis

### Description

The goal of this project is to perform data analytics on Uber trip data utilizing a suite of tools and technologies on the Google Cloud Platform. This includes GCP Storage for data storage, Compute Instances for processing, BigQuery for data analysis, Mage for ETL processes, and Looker Studio for visualization. This setup aims to streamline the data pipeline and enhance the analytical outputs from comprehensive taxi trip data.

### Architecture Diagram

  ![Architecture Diagram](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/architecture.jpg)

### Dataset Used

The project utilizes the TLC Trip Record Data, which includes extensive details about taxi trips conducted by yellow and green taxis in New York City. This rich dataset provides insights into taxi operations, passenger behavior, and fare dynamics. Key attributes include:

- **VendorID:** Identifies the provider (e.g., Creative Mobile Technologies, VeriFone Inc.).
- **tpep_pickup_datetime and tpep_dropoff_datetime:** Capture the start and end times of each trip.
- **Passenger_count:** Number of passengers per trip, as reported by the driver.
- **Trip_distance:** Distance traveled during the trip, measured in miles.
- **PULocationID and DOLocationID:** TLC Taxi Zones for pick-up and drop-off locations.
- **RateCodeID:** Type of rate applied to the trip (e.g., Standard, JFK, Newark).
- **Store_and_fwd_flag:** Indicates if the trip data was stored locally before being sent to the server due to lack of a direct connection.
- **Payment_type:** Method of payment (e.g., Credit card, Cash).
- **Fare_amount, Extra, MTA_tax, Improvement_surcharge, Tip_amount, Tolls_amount, Total_amount:** Various components of the fare.
- **Congestion_Surcharge:** Additional charge collected for rides passing through congested areas.
- **Airport_fee:** Fee applied to trips picked up at LaGuardia and John F. Kennedy Airports.

Further Resources:

  1. [Data Preview and Download](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/data/uber_data.csv)
  2. [NYC TLC Trip Record Data Information](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)
  3. [Detailed Data Dictionary](https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf)

### Tools and Technologies:

This project utilizes a variety of tools and technologies on the Google Cloud Platform for processing and analyzing Uber trip data:

- **Python:** The primary programming language used for scripting and data manipulation.
- **Google Cloud Storage (GCS):** Used for storing raw data as well as processed data.
- **Google Compute Engine:** Provides scalable compute instances to run Python scripts and handle data processing tasks.
- **Google BigQuery:** Serves as the analytics data warehouse, where all data querying and aggregation tasks are performed.
- **Mage:** A modern data pipeline tool utilized for efficient ETL processes, integrating seamlessly with other GCP services.
- **Looker Studio:** Used for creating interactive and visually appealing dashboards to display analytical insights derived from the data.

### Project Execution Flow
The Uber Data Analysis project follows a structured data pipeline designed to handle large volumes of taxi trip data efficiently:

- **Data Acquisition and Staging:**

  - **Retrieve Data:** Automatically fetch trip data files from the TLC Trip Record Data source and store them in Google Cloud Storage.
  - **Load Data:** Import these data files into staging tables in BigQuery for preliminary processing.
  
    ![Cloud Storage](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Images/Cloud%20Storage.jpg)

  - **Dimensional Modeling**

    ![Dimensional Model](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Images/Dimensional%20Model.jpg)

- **Google Compute Engine Setup:**

  - **Create Compute Instances:** Go to the Compute Engine section in the Google Cloud Console. Create new instances that will run your data processing jobs. Select the machine type that best fits your workload needs in terms of CPU, memory, and storage.
  
  - **Configure Network Settings:** Set up network configurations to ensure secure and efficient communication between your Compute Engine instances and other Google Cloud services like BigQuery and Cloud Storage.

    ![Compute Enginer](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Images/Compute%20Engine.jpg)
  
  - **Install Necessary Software:** Install Python and other required software on your instances. Use startup scripts to automate the setup process for any new instances.

    ```
    # Install Python and pip 
    sudo apt-get update
    
    sudo apt-get install python3-distutils
    
    sudo apt-get install python3-apt
    
    sudo apt-get install wget
    
    wget https://bootstrap.pypa.io/get-pip.py
    
    sudo python3 get-pip.py
    
    
    # Install Mage
    sudo pip3 install mage-ai
    
    # Install Pandas
    sudo pip3 install pandas
    
    # Install Google Cloud Library
    sudo pip3 install google-cloud
    
    sudo pip3 install google-cloud-bigquery
    
    sudo pip3 install db-dtypes
    ```

  - **ETL Processing with Mage:**

    - **Transformation:** Utilize Mage to transform staged data by applying transformation and cleaning as per the dimensional model, ensuring that the data adheres to the required schema and quality standards.

    - **Loading:** Load the transformed data into analytical tables in BigQuery, which are optimized for query performance, facilitating fast and efficient data analysis.

      ![Mage](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Mage/Mage%20Snapshot.jpg)

- **Data Analysis**

  - **BigQuery:** Use BigQuery to perform complex SQL queries that extract insights from the processed data. This analysis leverages BigQuery’s powerful data warehousing capabilities to uncover trends, patterns, and statistical information that inform strategic decisions. Here are some of the key analyses conducted:

  1. **Average Fare Amount Based on Vendor:** This query calculates the average fare amount collected from each vendor.
   
  2. **Average Fare Amount by Hour of the Day:** Analyzes fare amounts to determine how they vary by different hours of the day, providing insights into peak fare times.
   
  3. **Average Tip Amount by Payment Type:** This query evaluates how the average tip amount varies depending on the payment method used.
   
  4. **Total Fare Amount Based on Vendor:** Summarizes the total fare amount collected by each vendor, highlighting the revenue impact of each.
   
  5. **Total Number of Trips by Passenger Count:** This query examines the distribution of trips based on the number of passengers, which can help in understanding passenger behavior and preferences.

      ![BigQuery](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Images/Big%20Query.jpg)

  - **Visualization with Looker Studio**
    - **Looker Studio:** Utilized Looker Studio to create an interactive dashboard that presents comprehensive analytics from the Uber trip data. This visualization includes several components that highlight key aspects of the data:

    - **Filters:** Users can filter the data based on Vendor ID, Payment Type, Trip Distance, and Rate Code Name, allowing for customized views of the dataset.
    
    - **Summary Section:** Provides a quick snapshot of total earnings, number of trips, average trip distance, and average fare amounts.
    
    - **Map Visualization:** Displays the geographical distribution of trips, with color coding to differentiate between various rate codes such as Negotiated fare, Standard rate, JFK, Nassau or Westchester, and Group ride. This helps in visualizing high traffic areas and analyzing geographical trends.
    
    - **Charts Section:** Includes bar charts that show:
      - **Average Amount by Rate Code:** Compares the average fare amounts across different rate types.
      - **Average Amount by Payment Type:** Breaks down average fares by payment methods like Credit Card, Cash, No Charge, and Dispute, offering insights into payment preferences and patterns.
     
        ![Visualization](https://github.com/shantanup7/Uber-Data-Analysis/blob/main/Images/Uber_Dashboard.jpg)

    - Dashboard Link: https://lookerstudio.google.com/s/qm6cfSPdnR8
