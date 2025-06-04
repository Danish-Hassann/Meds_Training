# Lecture 1:

---

## Computer Architecture:

- Science and art of designing hardware, interfaces and system softwares to meet goals like performance, power, cost, or form factor.

## Types of Systems:

- **General Purpose**: Flexible and programmable (e.g., CPUs), but less efficient.
- **Special Purpose**: Highly efficient (e.g., GPUs, ASICs), but limited to specific tasks.

## Transistors:

- #### Nmos:

  - Conducts when the gate is high
  - used for pulling outputs low

- #### Pmos:
  - Conducts when the gate is low
  - used for pulling outputs high

# Lecture 2:

---

## Moore's Law:

Transistor density (transistors per chip area) increases exponentially over time. This led to:

- Smaller, faster chips
- lower power consumption

## Combinational Logic Circuits:

- Memoryless.
- Output only depends upon combination of applied inputs.

## Boolean Algebra: Useful Laws

| **Law**                      | **Dual Version 1**          | **Dual Version 2**              |
| ---------------------------- | --------------------------- | ------------------------------- |
| **Operations with 0 and 1s** | A + 0 = A                   | A · 1 = A                       |
|                              | A + 1 = 1                   | A · 0 = 0                       |
| **Idempotent Law**           | A + A = A                   | A · A = A                       |
| **Involution Law**           | (A')' = A                   | —                               |
| **Laws of Complementarity**  | A + A' = 1                  | A · A' = 0                      |
| **Commutative Law**          | A + B = B + A               | A · B = B · A                   |
| **Associative Law**          | A + (B + C) = (A + B) + C   | A · (B · C) = (A · B) · C       |
| **Distributive Law**         | A · (B + C) = A · B + A · C | A + (B · C) = (A + B) · (A + C) |

## Standardized Function Representations:

- **Sop form**: expresses a Boolean function as a sum of minterms where the output is `1`.
- **Pos form**: expresses a Boolean function as a product of maxterms where the output is `0`.
  `In short Pos is basically De Morgan of Sop.`

## Combinational Blocks

#### Decoders:

- Produces 2^n outputs from n inputs.
- Exactly one of the outputs is **1** (rest are 0s).
- Useful in determining how to interpret bit pattern.

#### Multiplexers:

- Selects **1 output from many inputs**.
- Controlled by selector lines.
- Used for: data routing, control logic.
- Can be used as lookup tables.

#### Adders:

- ##### Full Adder:

  - Adds three bits: A, B, and Carry-in (Cin)
  - Outputs: **Sum** and **Carry-out (Cout)**
  - **Sum** = A ⊕ B ⊕ Cin
  - **Carry-out (Cout)** = Majority(A,B,Cin)

- ##### Ripple Carry Adder
  - Connects **multiple full adders** in series.
  - Carry-out of one becomes carry-in of the next.
  - Used to add multi-bit binary numbers.
  - **Slower** due to carry propagation delay (ripple effect).

#### Programmable Logic Arrays (PLAs):

- Made of two programmable stages:
  - **AND stage** → creates input combinations (minterms).
  - **OR stage** → combines those combinations to get final outputs.
- You can **program which inputs connect** to which logic gates

# Lecture 3:

---

## Combinational Blocks (Continued):

#### Comparator (Equality Checker):

- Output is 1 if two N bit values are same.
- Use XNOR on each bit pair.
- AND all XNOR outputs for final result.

#### Arithmetic Logic Unit (ALU):

- Performs arithmetic and logic operations
- Output depends upon selected operation which is selected using function bits.

#### Tri-State Buffer:

- Has 3 outputs: `0`, `1`, and **high-impedance (Z)**
- **Z** means "disconnected" → doesn’t affect connected circuits
- Acts as a switch.

## Storage Elements:

#### SR Latch (NAND-based)

- Made using two cross-coupled **NAND** gates
- Inputs: **S̅** (Set) and **R̅** (Reset), both **active-low**
- Stores 1-bit of data

| S   | R   | Description      | Output                   |
| --- | --- | ---------------- | ------------------------ |
| 0   | 1   | Set              | Q = 1                    |
| 1   | 0   | Reset            | Q = 0                    |
| 1   | 1   | Hold (no change) | Q retains previous state |
| 0   | 0   | Invalid          | Undefined / Not allowed  |

#### Gated SR Latch

- Adds a **Write Enable (WE)** input
- When **WE = 0** → latch is disabled, holds value
- When **WE = 1** → S̅ and R̅ control the latch as usual

#### Register:

- Multiple D latches in parallel to store multi bit data.
- A single write enable signal for all the d latches.

#### Memory Arrays:

- **Address Decoding**:

  - n address bits → 2ⁿ memory locations
  - Decoder selects the corresponding **wordline**

- **Read/Write**:
  - **Read**: Multiplexer selects the data from the addressed location.
  - **Write**: Decoder enables the selected wordline to store new data.

## Finite State Machines:

- Digital system that transitions between **states** based on **inputs** and **clock**
- **States** store current condition (e.g., idle, active, done)
- **Clock** triggers transitions between states
- ##### Components of FSM:

  - **State Register**:  
    Stores the current state using **D flip-flops**, updated on each clock edge

  - **Next-State Logic**:  
    Combinational circuit that computes the **next state** from current state and inputs

  - **Output Logic**:
    - **Moore**: Output depends on current state only
    - **Mealy**: Output depends on current state and inputs

# Lecture 4:

---

## FSM State Encoding:

- **Binary Encoding**:

  - States are represented using **log₂(N)** bits (for N states).
  - Fewer flip-flops.
  - Combinational logic can be **complex** due to shared bit patterns.

- **One-Hot Encoding**:

  - Each state has its **own flip-flop**; only **one bit is HIGH** at a time.
  - Very **simple logic**.
  - Uses **more flip-flops** (N flip-flops for N states).

- **Output Encoding**:
  - Output values are **embedded directly in state bits**.
  - Eliminates separate output logic (useful in Moore machines).

## FSM Design Procedure:

- Determine all possible states.
- Develop a State Transition diagram.
- Start by defining the reset state then continue adding states and transitions.

# Lecture 5:

---

## HDL Implementation:

---

| Structural (Gate-Level)                     | Behavioral                                  |
| ------------------------------------------- | ------------------------------------------- |
| Module body contains gate-level description | Module body contains functional description |
| Describes how modules are interconnected    | Contains logical and mathematical operators |
| Lower level of abstraction                  | Higher level of abstraction                 |

#### Structural:

```
module mux2(input d0, d1,
            input s,
            output y);
   wire ns, y1, y2;

   not  g1 (ns, s);
   and  g2 (y1, d0, ns);
   and  g3 (y2, d1, s);
   or   g4 (y, y1, y2);

endmodule
```

#### Behavioral:

```
module mux2to1(
    input wire sel,
    input wire a,
    input wire b,
    output reg y
);

always @(*) begin
    case (sel)
        1'b0: y = a;
        1'b1: y = b;
        default: y = 1'b0;
    endcase
end

endmodule
```

## Key Verilog Concepts:

---

| Concept                                       | Description                                                                                                                                                                                                                                                      |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **always @ (sensitivity list)**               | A procedural block triggered when signals in the list change (e.g., `always @(posedge clk)` or `always @(*)`)                                                                                                                                                    |
| **Asynchronous vs Synchronous state changes** | _Asynchronous:_ State changes immediately on input change (e.g., `always @(a)`). <br> _Synchronous:_ State changes on clock edge (e.g., `always @(posedge clk)`).                                                                                                |
| **Blocking vs Non-blocking assignments**      | _Blocking (`=`):_ Executes sequentially, next statement waits for current to finish.<br> _Non-blocking (`<=`):_ Executes all assignments in parallel at the end of the time step (used for sequential logic).                                                    |
| **Rules for signal assignment**               | - Use **blocking (`=`)** in combinational `always` blocks.<br>- Use **non-blocking (`<=`)** in sequential (clocked) `always` blocks.<br>- Avoid mixing blocking and non-blocking in same block.<br>- For continuous assignment, use `assign` keyword with wires. |

## Sequential Logic Verilog:

#### D Latch:

```
module latch (
    input            clk,
    input      [3:0] d,
    output reg [3:0] q
);

  always @ (clk, d)
    if (clk)
      q <= d;      // latch is transparent when clock is 1

endmodule
```

#### D Flip Flop:

```
module flop(
    input          clk,
    input      [3:0] d,
    output reg [3:0] q
);

  always @ (posedge clk)
    q <= d;      // pronounced “q gets d”

endmodule
```

# Lecture 6:

---

## Combinational Circuit Timing:

#### Causes of Delay:

- Capacitance and Resistance in a circuit.
- Changes in environment.
- Aging of the circuit.

#### Input to Output Delays:

- **Propagation delay** maximum time it takes for a change in input to affect the output.
- **Contamination delay** minimum time after an input change when the output may start to change.

#### Delay Paths:

- **Critical Path**: longest path, determines the slowest timing and limits the clock speed.
- **Shortest Path**: minimum delay path, important for checking **hold time** violations.

#### Glitches:

- Single input transition causes multiple output transitions.
- Visible in k-maps.
- Add consensus terms to fix.

## Sequential Circuit Timing:

#### Flip Flop Timing Parameters:

- **Setup Time** minimum time before clock edge that data must be stable,
- **Hold Time** minimum time after clock edge that data must be stable.
- **tccq (Contamination delay)**: Earliest time after clock edge when Q may start changing.
- **tpcq (Propagation delay)**: Latest time after clock edge when Q becomes stable.

#### Time Constraints:

- **Setup**

  - depends on the **maximum delay**.
  - **Tc > tpcq + tpd + tsetup** .

- **Hold time**
  - depends on the **minimum delay**.
  - **tccq + tcd > thold**

## Circuit Verification:

#### Functional Verification:

- ##### Test benches:
  | Testbench     | Input/Output Generation | Error Checking |
  | ------------- | ----------------------- | -------------- |
  | Simple        | Manual                  | Manual         |
  | Self-Checking | Manual                  | Automatic      |
  | Automatic     | Automatic               | Automatic      |

#### Timing Verification:

- High-level simulation uses `#` delays for timing but is less accurate than real circuits.
- Circuit-level verification requires synthesis and tools like Vivado.
- Tools analyze setup/hold times, clock skew, and report worst-case delays and errors.
- Timing can fail due to high clock speeds or skew, needing manual debugging.
- Reports guide fixes (Timing reports) .
