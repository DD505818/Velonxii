
#!/bin/bash
echo "Initializing virtual environment..."
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo "Environment ready."
