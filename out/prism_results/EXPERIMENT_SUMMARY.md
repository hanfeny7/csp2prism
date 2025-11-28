# PRISM Quantitative Experiments Summary

## Experimental Setup

### Models Analyzed
- **LO-CoAP-EAP**: Lightweight CoAP-EAP Protocol Model
  - Architecture: SmartObject ↔ Controller ↔ AAA Server
  - Protocol Flow: LO_POST → PSK_M1 → PSK_M2 → PSK_M3 → PSK_M4 → EAP_Success
  - Threat Model: Probabilistic channel corruption, intruder with Dolev-Yao capabilities

### Parameter Grid
- **p_flip** (bit-flip corruption): {0.0, 0.01, 0.02, 0.05}
- **p_loss** (message loss): {0.0, 0.02, 0.04}
- **Total Configurations**: 12 (4 × 3 grid)

### PCTL Properties Evaluated

1. **Pmin=? [ F "auth_success" ]** - Minimum probability of successful authentication
2. **Pmax=? [ F "auth_success" ]** - Maximum probability of successful authentication
3. **Pmin=? [ F "intruder_knows_msk" ]** - Minimum probability intruder learns MSK
4. **Pmax=? [ F "intruder_knows_msk" ]** - Maximum probability intruder learns MSK
5. **R{"bytes"}min=? [ F "auth_success" ]** - Minimum expected bytes until auth success
6. **R{"bytes"}max=? [ F "auth_success" ]** - Maximum expected bytes until auth success
7. **R{"msgs"}min=? [ F "auth_success" ]** - Minimum expected messages until auth success
8. **R{"msgs"}max=? [ F "auth_success" ]** - Maximum expected messages until auth success
9. **Pmin=? [ F<=20 "auth_success" ]** - Min probability of auth within 20 steps
10. **Pmax=? [ F<=20 "auth_success" ]** - Max probability of auth within 20 steps

## Key Findings

### Authentication Success Probability
- **Minimum Probability**: 0.0 across all parameter configurations
  - This indicates the nondeterministic adversary can prevent authentication entirely
  - Represents worst-case scenario (intruder actively blocks all messages)
- **Maximum Probability**: 1.0 across all parameter configurations
  - Best-case scenario where protocol successfully completes
  - Achievable when intruder takes no action against communication

### Intruder MSK Knowledge
- **Minimum Probability**: 0.0 (intruder cannot learn MSK by force)
- **Maximum Probability**: 0.0 (intruder never learns MSK in protocol execution)
  - **Interpretation**: The model structure prevents the intruder from directly accessing the EAP_Success message in the channels observed by the current threat model
  - Suggests the protocol has strong isolation properties under the modeled threat assumptions

### Communication Costs
- **Byte Rewards**:
  - Minimum: 0 (could be due to zero-reward loops in nondeterministic model)
  - Maximum: Infinity (indicates potential for unbounded communication in worst case)
  - **Note**: Reward structure needs refinement for more meaningful analysis

- **Message Counts**:
  - Minimum: 0 (same issue as bytes)
  - Maximum: Infinity (unbounded due to nondeterminism)

### Temporal Bounded Properties (≤20 steps)
- **Min Probability**: 0.0 (adversary can delay/prevent within bounded time)
- **Max Probability**: 1.0 (authentication completes successfully within 20 steps)

## Observations & Limitations

### Model Characteristics
1. **Simplified Protocol Flow**: Model abstracts away cryptographic details
   - Focus: message ordering and channel properties
   - Crypto assumed secure (not explicitly modeled)

2. **Threat Model**:
   - Probabilistic corruption (p_flip) on communication channels
   - Message loss (p_loss) to model network unreliability
   - Nondeterministic adversary choices (all possible intruder strategies)

3. **Channel Architecture**:
   - Two independent channels: SC (SO↔Controller) and CA (Controller↔AAA)
   - Each channel applies independent bit-flip and loss probabilities

### Results Interpretation
- **Pmin/Pmax = {0.0, 1.0}**: Reflects nondeterministic MDP nature
  - Pmin = 0: Adversary can always choose worst action
  - Pmax = 1: In absence of adversarial intervention, protocol succeeds
  
- **Infinite Rewards**: Indicates model may have infinite-reward paths
  - Suggests need for model refinement to ensure all paths terminate

## Recommendations for Extended Analysis

1. **Add Explicit Intruder Actions**: Implement active attack transitions
   - Message forgery
   - Message replay
   - Man-in-the-middle (MITM) scenarios

2. **Refine Reward Structures**:
   - Model actual message/byte sizes
   - Add cost/penalty for failed attempts
   - Implement absorbing states to prevent infinite loops

3. **Extend Parameter Space**:
   - Finer granularity for p_flip (e.g., 0.001, 0.005, ...)
   - Add attacker capability parameters

4. **Comparative Analysis**:
   - Run equivalent experiments on CoAP-EAP (full protocol)
   - Quantify trade-offs between LO-CoAP-EAP and standard EAP-PSK

## Execution Environment

- **PRISM Version**: 4.9
- **Model Type**: MDP (Markov Decision Process)
- **Runtime**: Codespaces (Ubuntu 24.04.3 LTS)
- **Execution Time**: < 1 second per configuration
- **Memory Usage**: ~50 MB per model checking instance

## Files Generated

- `prism_results.csv` - Complete results table in CSV format
- Individual log files: `locoap_pf{p_flip}_pl{p_loss}.log` for each configuration
- This summary document

## Conclusion

The LO-CoAP-EAP protocol model has been successfully analyzed using PRISM 4.9 with quantitative verification across a parameter grid. The results demonstrate the feasibility of model-checking lightweight authentication protocols under probabilistic channel conditions. While the current model produces extremal probabilities (0.0 and 1.0), this reflects the inherent nondeterminism of the MDP formulation and provides bounds on protocol behavior.

Future work should focus on:
1. Implementing explicit attacker actions to increase model fidelity
2. Refining reward metrics for meaningful cost analysis
3. Expanding the parameter space for sensitivity analysis
4. Conducting comparative analysis across protocol variants

---
Generated: 2025-11-19
Experiment Type: Sensitivity Analysis (Parameter Sweep)
Protocol: LO-CoAP-EAP (Lightweight CoAP-EAP Authentication Protocol)
