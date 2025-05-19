import pandas as pd
import yfinance as yf

# URL of Wikipedia page
url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"

# Read the table
tables = pd.read_html(url)
sp500_df = tables[0]  # The first table is the S&P 500 list

# Save to Excel
sp500_df.to_excel("sp500_companies.xlsx", index=False)


tickers = sp500_df["Symbol"].tolist()

# Replace 'BRK.B' with 'BRK-B'
if 'BRK.B' in tickers:
    tickers[tickers.index('BRK.B')] = 'BRK-B'

# Replace 'BF.B' with 'BF-B'
if 'BF.B' in tickers:
    tickers[tickers.index('BF.B')] = 'BF-B'

results = []

# Loop through each ticker and get the required information
for ticker in tickers:
    try:
        stock = yf.Ticker(ticker)
        info = stock.info
        market_cap = info.get("marketCap", None)
        company_name = info.get("shortName", "N/A")
        dividend = info.get("dividendYield", "N/A")

        # Get today's closing price
        hist = stock.history(period="1d")
        close_price = hist['Close'].iloc[-1] if not hist.empty else None

        results.append({
            "Symbol": ticker,
            "Company Name": company_name,
            "Market Cap": market_cap,
            "Market Cap (B)": round(market_cap / 1e9, 2) if isinstance(market_cap, (int, float)) else "N/A",
            "Today's Close Price": round(close_price, 2) if close_price else "N/A",
            "Dividend Yield": round(dividend/100, 4) if isinstance(dividend, (int, float)) else float(0)
        })

    except Exception as e:
        print(f"Error for {ticker}: {e}")
        results.append({
            "Ticker": ticker,
            "Company Name": "Error",
            "Market Cap": "Error",
            "Market Cap (B)": "Error",
            "Today's Close Price": "Error",
            "Dividend Yield": "Error"
        })

# Convert to DataFrame
df_final = pd.DataFrame(results)

# Save to Excel
df_final.to_excel("sp500_summary_data.xlsx", index=False)