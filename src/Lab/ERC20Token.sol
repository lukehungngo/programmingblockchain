pragma solidity ^0.4.18;
contract MyToken {
   mapping (address => uint256) public balance;
   string public name;
   string public symbol;
   uint8 public decimals;
   uint256 public totalSupply;

   event Transfer(address indexed from, address indexed to, uint256 value);
   /* Khởi tạo hợp đồng ghi lại toàn bộ lượng token được cung cấp ban đầu,
      quyền sở hữu thuộc về người khởi tạo*/

   function MyToken(uint256 initialSupply, string tokenName,
   string tokenSymbol, uint8 decimalUnits) {
       // Gán quyền sở hữu toàn bộ lượng token ban đầu cho người khởi tạo
       balance[msg.sender] = initialSupply;
         // Gán tên cho token
        name = tokenName;
        // Gán kí hiệu cho token
        symbol = tokenSymbol;
        // Gán đơn vị chia
        decimals = decimalUnits;
        // Gán tổng lượng cung lớn nhất
        totalSupply = initialSupply;
    }

    /* Phương thức chuyển token*/
    function transfer(address _to, uint256 _value) {
       // Kiểm tra số dư của người kích hoạt
        require(balance[msg.sender] >= _value);
        // Kiểm tra tràn số
        require(balance[_to] + _value >= balance[_to]);
        // Trừ số dư của người gửi
        balance[msg.sender] -= _value;
        // Tăng số dư của người nhận
        balance[_to] += _value;
        /* Ghi log lại các thông tin */

        Transfer(msg.sender, _to, _value);
    }

    /* Truy vấn tên token*/
    function name() constant returns (string) {
     return name;
    }

    /* Truy vấn kí hiệu token*/
    function symbol() constant returns (string) {
     return symbol;
    }

    /* Truy vấn độ chia nhỏ nhất*/
    function decimals() constant returns (uint8) {
     return decimals;
    }

    /* Truy vấn lượng cung Token tối đa*/
    function totalSupply() constant returns (uint256) {
     return totalSupply;
    }
    
    /* Truy vấn số dư*/
    function balanceOf(address _owner)  constant returns (uint256) {
     return balance[_owner];
    }
}
