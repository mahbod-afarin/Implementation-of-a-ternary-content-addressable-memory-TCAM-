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
