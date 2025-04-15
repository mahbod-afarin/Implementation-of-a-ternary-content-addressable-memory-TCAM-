## Ternary Content-Addressable Memory (TCAM)

TCAM is a special type of memory used in high-speed searching applications such as:
- Data compression
- Databases
- Intelligent systems

### 📚 What is TCAM?

TCAM extends regular CAM (Content Addressable Memory) by allowing three possible stored values:
- `0`
- `1`
- `X` (don't care)

During a match operation, bits marked `X` are treated as matching any input bit.

### 🧪 Matching Example

Searching for the value `01101110` in a TCAM would result in matches with any of the following entries:

```
X1101XXX 0X1X11X0 0110XXXX
```

### ✅ Task

Design and implement a TCAM module with:
- **16 registers**
- **Each register is 16 bits wide**
- Matching logic that supports the `X` wildcard behavior

--

## 📘 Overview

In this experiment, we implemented a **ternary content-addressable memory (TCAM)** in which each memory cell can hold three values: `0`, `1`, or `X`.

To represent each ternary digit (trit), **2 bits** were allocated:
- Each memory cell was designed to store 5 ternary digits.
- Each digit was encoded using two bits as follows:
  - `00` → **0**
  - `11` → **1**
  - `01` or `10` → **X** (don't care)

### 📦 Memory Encoding Structure

- Bits 0 and 1 represent the **first trit**
- Bits 2 and 3 represent the **second trit**
- And so on...

## 🛠 Implementation Details

### 📝 Writing Data

To write data to memory:
- Simply place the `data` directly into the memory at address `addr` if `wr == 1`.

### 🔍 Matching Logic

To find a match:
- A `for` loop was used to search through all memory entries.
- The goal was to find the first memory cell that **matches** the input `data`, considering `X` as a wildcard.

> For example, an input of `X0` matches both `00` and `10`.

### 🔁 Supporting Functions

- `matches`:  
  A helper function to compare two trits using ternary matching logic.

- `to7segment`:  
  Converts the matched memory address into 7-segment display format.

---

## 🚨 Special Case Handling

As suggested by the teaching assistant during class:
- If the input value **is not found** in any memory address, the number **99** is displayed on the **7-segment** display.
- This helps differentiate a "no match found" case.

## 📊 Simulation

Our testbench code simulates various memory search scenarios:

- A few values were preloaded into memory.
- Then, we searched for different inputs:
  - In the first two cases, **matches were found** and the waveforms confirmed correct address decoding.
  - In the last test case, **no match existed**, and the 7-segment display correctly showed **99**.

### 🖼 Output

- `r_addr0`: Used for the **least significant digit** of the address.
- `r_addr1`: Used for the **most significant digit**.

Waveform and simulation images (from ModelSim or equivalent) can be included in a `/waveforms` folder.


