## 📌 Caching and API Failure Handling

### **Caching Mechanism**
The application uses a local caching system to avoid unnecessary API calls and improve performance.

- **Key Identification:**  
  Each currency pair (`FROM` → `TO`) is stored in local storage (`SharedPreferences`) with a unique key format:
  ```
  conversion_{FROM}_{TO}
  ```
  Example: `conversion_USD_INR`

- **Stored Data Structure:**
  ```json
  {
    "rate": 83.25,
    "timestamp": 1723625552000
  }
  ```
    - `rate` → Value of 1 unit of the base currency in terms of the target currency.
    - `timestamp` → Time (in milliseconds) when the API data was fetched.

- **Cache Validation Rules:**
    1. When a currency pair is requested:
        - Check if cached data exists for that pair.
        - If **cache exists**:
            - If **data age ≤ 5 minutes** → Use cached data (skip API call).
            - If **data age > 5 minutes** → Use cached data **with a warning** (`Data may be outdated`) and trigger background API refresh.
        - If **no cache exists** → Call API and store the result with the current timestamp.

---

### **API Failure Handling**
The application handles API failures gracefully:

- **Case 1: Cache Available**
    - If API fails but cache exists → Show cached data with a warning:
      > ⚠ Data shown may be outdated due to network issues.

- **Case 2: No Cache Available**
    - If API fails and no cache exists → Show an error message:
      > ❌ Unable to fetch currency data. Please try again later.

