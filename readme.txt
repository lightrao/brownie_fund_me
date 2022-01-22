(base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ python3.9 -m venv .venv

(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ pip --version
pip 21.0.1 from /Users/lightrao/Desktop/Learning Blockchain/demos/brownie_fund_me/.venv/lib/python3.9/site-packages/pip (python 3.9)

(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ python -m pip install --upgrade pip
(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ pip install eth-brownie
(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ brownie init --force

https://youtu.be/M576WGiDBdQ?t=18687
(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ brownie compile
Brownie v1.17.2 - Python development framework for Ethereum

Compiling contracts...
  Solc version: 0.6.12
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
Generating build data...
 - smartcontractkit/chainlink-brownie-contracts@1.1.1/AggregatorV3Interface
 - smartcontractkit/chainlink-brownie-contracts@1.1.1/SafeMathChainlink
 - FundMe

 https://youtu.be/M576WGiDBdQ?t=18690

(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890 no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ brownie run scripts/deploy.py --network rinkebyBrownie v1.17.2 - Python development framework for Ethereum

BrownieFundMeProject is the active project.

Running 'scripts/deploy.py::main'...
Deploying FundMe...
Transaction sent: 0xb878adcec969fb982e215af7269ef36064443da6c40b36b5490b2f6e76d486e3
  Gas price: 1.000000009 gwei   Gas limit: 429693   Nonce: 8
  FundMe.constructor confirmed   Block: 9963812   Gas used: 390630 (90.91%)
  FundMe deployed at: 0x8Bb0DE31bB54723aDe2cE614Baa58BDA8076c88d

Waiting for https://api-rinkeby.etherscan.io/api to process contract...
Verification submitted successfully. Waiting for result...
Verification pending...
Verification complete. Result: Pass - Verified
Contract deployed to 0x8Bb0DE31bB54723aDe2cE614Baa58BDA8076c88d

Deploying to ganach:
https://youtu.be/M576WGiDBdQ?t=19259
https://youtu.be/M576WGiDBdQ?t=19912

Deploying to persistant ganach:
https://youtu.be/M576WGiDBdQ?t=20204

Adding a network to brownie:
https://youtu.be/M576WGiDBdQ?t=20271

(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ brownie networks add Ethereum ganache-local host=http://127.0.0.1:8545 chainid=1337
Brownie v1.17.2 - Python development framework for Ethereum

SUCCESS: A new network 'ganache-local' has been added
  └─ganache-local
    ├─id: ganache-local
    ├─chainid: 1337
    └─host: http://127.0.0.1:8545
(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ 

(.venv) (base) raoyangdeMacBook-Pro:brownie_fund_me lightrao$ brownie run scripts/deploy.py --network ganache-local

Withdraw and Fund:
https://youtu.be/M576WGiDBdQ?t=20563

https://youtu.be/M576WGiDBdQ?t=20830

test:
https://youtu.be/M576WGiDBdQ?t=20823
https://youtu.be/M576WGiDBdQ?t=21237

mainnet-fork:
https://youtu.be/M576WGiDBdQ?t=21287