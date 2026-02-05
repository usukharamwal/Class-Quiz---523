# Analysis Note: Child Mortality and GDP per Capita

## Purpose
This project combines child mortality and GDP per capita data into one analysis-ready table and visualizes their relationship over time. The goal is to make the clear work-flow and reproducible.

## Data Cleaning Strategy

### 1. Source format and challenge
Both raw datasets were provided in **wide format** (excel language), where each year was a separate column (e.g., 1800, 1801, 1802, ...). This structure is hard to analyze directly because years are encoded as column names rather than observations.

### 2. Wide-to-tidy transformation
Each dataset was reshaped into **tidy (long) format** using:
- Identifier columns: `geo`, `name`
- Year column: `year`
- Value column:
  - `mortality_rate` for child-motality.csv dataset
  - `gdpcapita` for GDP-data dataset

This makes each row represent one `geo`–`name`–`year` observation, which is easier to merge, filter, and plot.

### 3. Type and missing-value handling
- `year` was converted to numeric/integer.
- `mortality_rate` and `gdpcapita` were converted to numeric.
- After merging, empty values in `mortality_rate` and `gdpcapita` were replaced with `0` to keep the table complete for downstream processing.

### 4. Merge design
The two cleaned dataframes were merged on:
- `geo`
- `name`
- `year`

Final merged schema:
1. `geo` (first column, as required)
2. `name`
3. `mortality_rate`
4. `gdpcapita`
5. `year`

This consistent schema supports both reproducibility and future extensions.

## Visualization Choices

## Plot type
A scatter plot was plotted to show the relationship between:
- **X-axis:** GDP per capita (`gdpcapita`)
- **Y-axis:** Child mortality rate (`mortality_rate`)

## Year encoding
Point color represents `year`, allowing temporal progression to be viewed in a single chart instead of many separate figures.

## X-axis scaling
GDP per capita was plotted on a **log scale** to handle large cross-country differences and reduce compression of low-income observations.

## Output location
The figure is saved to:
- `paper/figs/mortality_vs_gdpcapita_scatter.png`

This keeps analytical outputs organized under the `paper` directory.

## Why these matter:
- Clean data makes methods reusable and easier to debug.
- Explicit merge keys (`geo`, `name`, `year`) prevent ambiguous joins.
- A single, interpretable visualization quickly communicates the core relationship.
- Organized outputs (`data/preprocessed`, `paper/figs`) make the project easier to maintain and reproduce.
