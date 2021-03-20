pragma solidity 0.5.16;
import {SafeMath} from "./SafeMath.sol";

contract CarSale {
    using SafeMath for uint256;

    /*
     * Storage
     */
    struct CarEntity {
        uint256 priceInWei;
        address id;
        uint256 quantity;
    }

    address public owner;
    mapping(address => CarEntity) public inventories;

    /*
     * Events
     */
    event AddInventory(
        uint256 indexed priceInWei,
        address id,
        uint256 quantity
    );
    event addSale(
        address id,
        uint256 quantity
    );
    /*
     * Modifier
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /*
     * Constructor
     */
    constructor() public {
        owner = msg.sender;
    }

    /*
     * Public Functions
     */
    function addCarInventory(
        address carAddr,
        uint256 carPriceInWei,
        uint256 quantity
    ) public onlyOwner() returns (bool success) {
        require(carAddr != address(0) && carPriceInWei > 0 && quantity > 0);

        // existing car
        if (inventories[carAddr].quantity > 0) {
            inventories[carAddr].quantity = inventories[carAddr].quantity.add(
                quantity
            );
            inventories[carAddr].priceInWei = carPriceInWei;
        } else {
            inventories[carAddr] = CarEntity({
                priceInWei: carPriceInWei, 
                id:carAddr, 
               quantity: quantity
            });
        }

        emit AddInventory(carPriceInWei, carAddr, quantity);
        return true;
    }

    /*
     * Public Functions
     */
    function addCarSale(address carAddr, uint256 quantity)
        public
        onlyOwner()
        returns (bool success)
    {
        require(inventories[carAddr].quantity > quantity);
        inventories[carAddr].quantity = inventories[carAddr].quantity.sub(
            quantity
        );
        
        emit addSale(carAddr, quantity);
        return true;
    }
}
