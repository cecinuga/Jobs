//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

interface IPancakeRouter01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path) external view returns (uint256[] memory amounts);
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2;

interface IPancakeRouter02 is IPancakeRouter01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}


//MAINNET ROUTER: 0x10ED43C718714eb63d5aA57B78B54704E256024E
//MAINNET WBNB: 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
//MAINNET TESTTOKEN: 0xe31013216Cdc0cf54A9dA564E69c213a30435f1D

//TESTNET ROUTER: 0xD99D1c33F9fC3444f8101754aBC46c52416550D1
//TESTNET FACTORY: 0x6725F303b657a9451d8BA641348b6761A6CC7a17
//TESTNET WBNB: 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd
contract ShibAfrica {
    address public WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address public ROUTER = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    address public SHIBAFRICA = 0xe31013216Cdc0cf54A9dA564E69c213a30435f1D;
    address payable owner;
    address payable buyback;

    mapping(uint => uint) public Packages;
    mapping(address => uint) public levels;

    constructor(address _owner, address _buyback) public {

        owner=payable(_owner);
        setLevel(owner, 10);
        buyback=payable(_buyback);

        Packages[1] = 1;
        Packages[2] = 2;
        Packages[3] = 5;
        Packages[4] = 10;
        Packages[5] = 20;
        Packages[6] = 50;
        Packages[7] = 100;
        Packages[8] = 200;
        Packages[9] = 400;
        Packages[10] = 800;
    }
    
    modifier onlyOwner() { require(msg.sender==owner,'OnlyOwner.');_; }
    modifier validPackage(uint package) { require(package>=1&&package<=9,'Invalid Package.');_; }
    function setLevel(address user, uint level) onlyOwner validPackage(level) public { levels[user]=level; }
    
    //RICORDATI LE TASSE
    function buyPackage(address payable referral, uint package, uint amount)  
        internal payable validPackage(package) returns(bool){
            if(package==levels[msg.sender]+1) levels[msg.sender]=package;

            uint referral_amount = 35*amount/100;//OK   //un utente può comprare più pacchetti ma solo consecutivamente
            uint token_amount = 30*amount/100;//crea una seconda funzione buyPackages che chiama tante volte buyPackage con tanti controlli
            uint owner_amount = 20*amount/100;//OK
            uint buyback_amount = 15*amount/100;//OK

            if(levels[referral]>=package){
                referral.transfer(referral_amount);
            } else{
                buyback.transfer(referral_amount);
            }
            
            buyback.transfer(buyback_amount);
            owner.transfer(owner_amount);

            //BUY WITH PANCAKE SWAP
            IPancakeRouter02(ROUTER).swapExactETHForTokens{value:amount}(0, [WBNB,SHIBAFRICA], msg.sender, block.timestamp+(block.timestamp/1000));

            return true;
    }
    function buyPackages(address payable referral, uint[] memory packages) public payable {
        //controlli referral
        uint value = msg.value;
        require(packages[0]>=levels[msg.sender],'Invalid Level.');
        for(uint i; i < packages.length; i++){
            if(i!=packages.length-1){ require(packages[i]==packages[i+1]-1,'Not Consecutive.'); }
            value -= Packages[i+1]*5/100;
            require(value>=0,'Invalid Payment.');
            //require(levels[msg.sender]>=packages[i]-1,'Buy Before Smallest Package.');

            require(buyPackage(referral, packages[i], Packages[packages[i]]*5/100),'Package not Buyed.');
        }
    }
}
