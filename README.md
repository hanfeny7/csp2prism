# PAT2PRISM Protocol Converter

## Project Overview
PAT2PRISM is an automated tool for protocol modeling and verification, supporting the conversion of PAT (Process Analysis Toolkit) specifications into PRISM models. The tool integrates syntax preprocessing, intelligent type inference, and automatic message field extraction, greatly improving the efficiency and accuracy of protocol modeling. It is suitable for formal methods, protocol security analysis, and academic research.

## Main Features
- **PAT → PRISM Automatic Conversion**: One-click conversion from PAT protocol specifications to PRISM models for verification.
- **Web UI Visualization**: Online editing, conversion, result display, and copy functionality. The interface is styled after VSCode for familiarity.
- **Syntax Preprocessing**: Automatic normalization of PAT code, filtering of system processes, and correction of common syntax issues.
- **Message Field Extraction**: Intelligent analysis of send/receive operations to generate message fields automatically.
- **Type Inference and Variable Classification**: Automatic recognition of nonce, ID, MAC, bool, and other variable types.
- **Statistics and Hints**: Displays statistics on processes, channels, and variables after conversion to assist model checking.
- **Error and Warning Reporting**: Detailed syntax error and warning messages to help users correct input.

## Installation & Usage
### Requirements
- Python 3.8+
- Flask
- antlr4-python3-runtime
- Other dependencies listed in `requirements.txt`

### Quick Start
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Start the Web UI:
   ```bash
   cd webui
   python app.py
   ```
3. Open your browser and visit:
   [http://localhost:5000](http://localhost:5000)

### Command Line / Script Usage
- See the `tools/` directory and related Python scripts for batch processing.

## Directory Structure
```
pat2prism/         # Core PAT→PRISM conversion logic
webui/             # Web frontend and backend (Flask)
tools/             # Auxiliary scripts and batch tools
examples/          # Example PAT/PRISM files
README.md          # Project documentation
LICENSE            # MIT License
requirements.txt   # Python dependencies
```

## Example Workflow
- Input: PAT protocol specification (see `examples/`)
- Output: PRISM model code, ready for PRISM Model Checker
- Features: One-click copy, statistics display, error reporting

## Reproducibility & Review Notes
- This tool is provided as a companion to a CCF-B paper. All core code, examples, and experiment scripts are open source.
- For questions or suggestions, please use GitHub Issues or contact the author.

## License
MIT License. See the LICENSE file for details.

---
> This tool has undergone multiple iterations. The interface and features are continuously optimized. Academic feedback and collaboration are welcome!
