pragma solidity >=0.5.0 <0.8.0;

contract ComptrollerInterface {
    /// @notice Indicator that this is a Comptroller contract (for inspection)
    bool public constant isComptroller = true;

    /*** Assets You Are In ***/

    function enterMarkets(address[] calldata uTokens) external returns (uint[] memory);
    function exitMarket(address uToken) external returns (uint);

    /*** Policy Hooks ***/

    function mintAllowed(address uToken, address minter, uint mintAmount) external returns (uint);
    function mintVerify(address uToken, address minter, uint mintAmount, uint mintTokens) external;

    function redeemAllowed(address uToken, address redeemer, uint redeemTokens) external returns (uint);
    function redeemVerify(address uToken, address redeemer, uint redeemAmount, uint redeemTokens) external;

    function borrowAllowed(address uToken, address borrower, uint borrowAmount) external returns (uint);
    function borrowVerify(address uToken, address borrower, uint borrowAmount) external;

    function repayBorrowAllowed(
        address uToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function repayBorrowVerify(
        address uToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function liquidateBorrowAllowed(
        address uTokenBorrowed,
        address uTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function liquidateBorrowVerify(
        address uTokenBorrowed,
        address uTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function seizeAllowed(
        address uTokenCollateral,
        address uTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function seizeVerify(
        address uTokenCollateral,
        address uTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function transferAllowed(address uToken, address src, address dst, uint transferTokens) external returns (uint);
    function transferVerify(address uToken, address src, address dst, uint transferTokens) external;

    /*** Liquidity/Liquidation Calculations ***/

    function liquidateCalculateSeizeTokens(
        address uTokenBorrowed,
        address uTokenCollateral,
        uint repayAmount) external view returns (uint, uint);

    function mintedVAIOf(address owner) external view returns (uint);
    function setMintedVAIOf(address owner, uint amount) external returns (uint);
    function getVAIMintRate() external view returns (uint);
}
