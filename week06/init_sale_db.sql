-- 用户表
CREATE TABLE `sales`.`users`  (
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) NULL COMMENT '用户名',
  `user_password` varchar(50) NULL COMMENT '用户密码',
  `phone` varchar(20) NULL COMMENT '电话',
  `email` varchar(50) NULL COMMENT '邮件',
  `create_time` datetime NULL COMMENT '创建时间',
  `last_update_time` datetime NULL COMMENT '组后修改时间',
  `remark` varchar(255) NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
);

-- 商品表
CREATE TABLE `sales`.`goods`  (
  `goods_id` varchar(50) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) NULL COMMENT '商品名称',
  `create_time` datetime NULL COMMENT '创建时间',
  `last_update_time` datetime NULL COMMENT '最后更新时间',
  PRIMARY KEY (`goods_id`)
);

-- 订单表
CREATE TABLE `sales`.`order_info`  (
  `order_id` varchar(50) NOT NULL COMMENT '订单ID',
  `order_number` int NULL COMMENT '订单编号',
  `buyer_id` varchar(50) NULL COMMENT '买家ID',
  `trade_status` tinyint(2) NULL COMMENT '交易状态： 0 进行中；1 已完成；2 已取消',
  `pay_status` tinyint(255) NULL COMMENT '支付状态，1、未付款；2、已付款',
  `order_amount` decimal(255) NULL COMMENT '订单金额',
  `total_amount` decimal(255) NULL COMMENT '实收金额',
  `create_date` datetime NULL COMMENT '创建时间',
  `last_update_time` datetime NULL COMMENT '最后更新时间',
  `remark` varchar(255) NULL COMMENT '备注',
  PRIMARY KEY (`order_id`)
);

-- 订单明细
CREATE TABLE `sales`.`order_detail`  (
  `item_id` varchar(50) NOT NULL COMMENT '订单明细ID',
  `order_id` varchar(50) NULL COMMENT '订单ID',
  `buyer_id` varchar(50) NULL COMMENT '买家ID',
  `seller_id` varchar(2) NULL COMMENT '卖家ID',
  `item_price` decimal(255) NULL COMMENT '商品价格',
  `goods_number` decimal(255) NULL COMMENT '商品数量',
  `goods_amount` decimal(255) NULL COMMENT '单项金额',
  `create_date` datetime NULL COMMENT '创建时间',
  `last_update_time` datetime NULL COMMENT '最后更新时间',
  `remark` varchar(255) NULL COMMENT '备注',
  PRIMARY KEY (`item_id`)
);