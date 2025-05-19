# 📊 S&P 500 Market Analysis Dashboard

This project provides a dynamic visualization of key metrics from companies in the S&P 500 index, including market capitalization, geographic distribution, sector breakdown, and dividend yields.

## 📌 Project Overview

- **Objective**: Create an interactive dashboard to explore and analyze S&P 500 companies based on various financial and categorical attributes.
- **Data Source**: 
  - 📄 [S&P 500 Wikipedia page](https://en.wikipedia.org/wiki/List_of_S%26P_500_companies) – Scraped using Python.
  - 📈 [Yahoo Finance](https://finance.yahoo.com) – Historical and fundamental data fetched using the `yfinance` library.
- **Tech Stack**:
  - **Python**: For web scraping, data collection, and cleaning
  - **Pandas**: For tabular data processing and cleaning
  - **Excel**: For manual cleaning and formatting
  - **Tableau**: For building the final visualization dashboard

## 🧹 Data Pipeline

1. **Web Scraping**: Scraped ticker symbols and metadata of S&P 500 companies from Wikipedia.
2. **Data Enrichment**: Used the `yfinance` Python library to collect market cap, dividend yield, closing prices, and other financials.
3. **Data Cleaning**: Cleaned and structured the dataset using pandas, with some formatting in Excel.
4. **Visualization**: Imported the cleaned dataset into Tableau to build an interactive dashboard.

## 📊 Dashboard Highlights

- 🗺️ **Geographic Distribution** of companies by headquarters state (U.S. Map)
- 💰 **Market Capitalization Bubble Chart** showcasing the largest players
- 📉 **Closing Price Bar Chart** for comparing recent stock prices
- 💸 **Top Dividend Yielding Stocks** with filterable logic to highlight high-yield investments
- 🧩 **Sector Breakdown Pie Chart** to show market diversity
- 📋 **Detailed Company Info Table** including founding year, ticker symbol, and more
- 📅 **Note**: All data was collected as of **May 15th, 2025**

## 🔗 Interactive Dashboard

👉 [View the full dashboard on Tableau Public](https://public.tableau.com/app/profile/michael.tartamella/viz/SP500_Vizualization/SP500InsightsMarketCapLocationandSectorAnalysis?publish=yes)

## 📁 Repository Contents

├── S&P500_Data.py. # Python script used to scrape and gather data\
├── S&P500 data combined.xlsx # Cleaned dataset used in the dashboard\
├── S&P500_Vizualization.twbx # Tableau packaged workbook file\
├── README.md # This file

## 📬 Contact

**Michael Tartamella**  
📧 mtartamella117@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/michael-tartamella/)

---
