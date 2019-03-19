/*
 Navicat Premium Data Transfer

 Source Server         : 本机测试
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : 192.168.99.100:3306
 Source Schema         : addon_shop_test

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 19/03/2019 18:22:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_config_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Index', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, 'Config', 'fa-toggle-on', 'config', NULL, '2019-03-19 07:05:26', '2019-03-19 07:05:26');
INSERT INTO `admin_menu` VALUES (9, 0, 9, 'EnvManager', 'fa-gears', 'env-manager', NULL, '2019-03-19 07:08:50', '2019-03-19 07:08:50');
INSERT INTO `admin_menu` VALUES (10, 0, 9, 'Helpers', 'fa-gears', '', NULL, '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_menu` VALUES (11, 10, 10, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_menu` VALUES (12, 10, 11, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_menu` VALUES (13, 10, 12, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_menu` VALUES (14, 10, 13, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_menu` VALUES (15, 0, 14, 'Redis manager', 'fa-database', 'redis', NULL, '2019-03-19 07:18:21', '2019-03-19 07:18:21');
INSERT INTO `admin_menu` VALUES (16, 0, 15, 'Log viewer', 'fa-database', 'logs', NULL, '2019-03-19 07:18:31', '2019-03-19 07:18:31');
INSERT INTO `admin_menu` VALUES (17, 0, 16, 'Exception Reporter', 'fa-bug', 'exceptions', NULL, '2019-03-19 07:21:37', '2019-03-19 07:21:37');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.99.1', '[]', '2019-03-19 06:54:13', '2019-03-19 06:54:13');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Admin Config', 'ext.config', NULL, '/config*', '2019-03-19 07:05:26', '2019-03-19 07:05:26');
INSERT INTO `admin_permissions` VALUES (7, 'Admin helpers', 'ext.helpers', NULL, '/helpers/*', '2019-03-19 07:12:39', '2019-03-19 07:12:39');
INSERT INTO `admin_permissions` VALUES (8, 'Redis Manager', 'ext.redis-manager', NULL, '/redis*', '2019-03-19 07:18:21', '2019-03-19 07:18:21');
INSERT INTO `admin_permissions` VALUES (9, 'Logs', 'ext.log-viewer', NULL, '/logs*', '2019-03-19 07:18:31', '2019-03-19 07:18:31');
INSERT INTO `admin_permissions` VALUES (10, 'Exceptions reporter', 'ext.reporter', NULL, '/exceptions*', '2019-03-19 07:21:37', '2019-03-19 07:21:37');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-03-19 06:50:13', '2019-03-19 06:50:13');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$wBCjfjkD93Ed6H3VJJnq4uIvSbTYrtnpd07yEXF58Jof.tJXUTjOq', 'Administrator', NULL, 'VSbDRxRJCTV1TAnF3lZyFSwMUp1qM1vrfxTPoxiZkycfd6v19UUgwtkTSPOT', '2019-03-19 06:50:13', '2019-03-19 06:50:13');

-- ----------------------------
-- Table structure for laravel_exceptions
-- ----------------------------
DROP TABLE IF EXISTS `laravel_exceptions`;
CREATE TABLE `laravel_exceptions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` int(11) NOT NULL,
  `trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of laravel_exceptions
-- ----------------------------
INSERT INTO `laravel_exceptions` VALUES (1, 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError', '0', 'Class \'App\\Providers\\Dingo\\Api\\Auth\\Provider\\JWT\' not found', '/data/htdocs/afagou/addonshop/afagou-addon-shop/app/Providers/AppServiceProvider.php', 27, '#0 [internal function]: App\\Providers\\AppServiceProvider->App\\Providers\\{closure}(Object(Illuminate\\Foundation\\Application))\n#1 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Auth/Auth.php(216): call_user_func(Object(Closure), Object(Illuminate\\Foundation\\Application))\n#2 /data/htdocs/afagou/addonshop/afagou-addon-shop/app/Providers/AppServiceProvider.php(28): Dingo\\Api\\Auth\\Auth->extend(\'jwt\', Object(Closure))\n#3 [internal function]: App\\Providers\\AppServiceProvider->boot()\n#4 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(572): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(819): Illuminate\\Container\\Container->call(Array)\n#9 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(802): Illuminate\\Foundation\\Application->bootProvider(Object(App\\Providers\\AppServiceProvider))\n#10 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(App\\Providers\\AppServiceProvider), 32)\n#11 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(803): array_walk(Array, Object(Closure))\n#12 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#13 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(211): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(Illuminate\\Foundation\\Application))\n#14 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(162): Illuminate\\Foundation\\Application->bootstrapWith(Array)\n#15 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(146): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#16 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#17 /data/htdocs/afagou/addonshop/afagou-addon-shop/public/index.php(53): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#18 {main}', 'GET', '/', '[]', '', '{\"remember_admin_59ba36addc2b2f9401580f014c7f58ea4e30989d\":\"eyJpdiI6InkxUEIwTjRPTmtnazhxUFJhWEZKUkE9PSIsInZhbHVlIjoiWlJBZm1QeVNheXRvSTNSV1JkZkQ5c054dDJSdnl5dUdjeUNzK3BmdnpQb0pNUkJOZ3JiT1wvXC9YSlo1MTgxMUJvb2p4QXUzUlFGMTV2dlhmMTRUamxuenJya0hIcEJEV0RVVjBtcEhabmFZRXFQRHRpV3ltOE9NNEpGUWN5Rk1RaVphRjBLNHBCUWQ5K2xhMmFkOEV0MmdMXC9tQXN3Z0ZRejY0cTEzQ2tFV2tJPSIsIm1hYyI6IjE2NGE5YjA1NjBmY2MyODBhYjM5OTllMjE5MGYxMzBlZDNjY2U5NTRhNTc0MDUwYjY0MWQwZDU3ODc4YjUxOTEifQ==\",\"XSRF-TOKEN\":\"eyJpdiI6Im0wb1d5WFpJY3VjU1ZXT3JqdGtWeXc9PSIsInZhbHVlIjoiVlZRdzN3c0M5OUJNWmlMUW5lVkM0RXN6VVJTRjRkV2pya2RsV0VEQTUwUnNWbXpcL2xaV3BkRnFGS1RTUzhxK2IiLCJtYWMiOiIwMzNiMzg4NjYzOWZjNmYyODJjYTA0ZGUzYWZmMmJkZGYyNzU2NGNiYTg2NmUxYjNhMzA0NjZkMmQxYjUwMzY2In0=\",\"laravelvue_session\":\"eyJpdiI6IlI2SEhOUzhPXC9jeVUwWmRPN0ZJM1JBPT0iLCJ2YWx1ZSI6Ikg1Q1orWHJ1Q2dFYmdCWTk0dHZ6emJRdUNUd1pMaUo1M1ZwSmdjWFlna2ljVGY4TlQ1c3p5S1NiNGoyeExsVkMiLCJtYWMiOiI2Y2Q2YTVkMWZiODc4ZWFmYjZhNmVmMDcwN2U1OWRhYzIyY2FjZGY4MzFlN2VjNzkwNDVlZTcwMTRiOTBmY2UyIn0=\",\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hZGRvbi50ZXN0XC9hcGlcL2xvZ2luIiwiaWF0IjoxNTUyOTc4NjAwLCJleHAiOjE1NTMwNjUwMDAsIm5iZiI6MTU1Mjk3ODYwMCwianRpIjoiM0NvMDYzSVpRaXVBeWV3diIsInN1YiI6MSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.1QiPajbKmx_qrzkbNCyFYjN7IPi8l-UXf9mpIUiF4MY\"}', '{\"accept-language\":[\"zh-CN,zh;q=0.9\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/72.0.3626.121 Safari\\/537.36\"],\"upgrade-insecure-requests\":[\"1\"],\"cache-control\":[\"no-cache\"],\"pragma\":[\"no-cache\"],\"connection\":[\"keep-alive\"],\"host\":[\"addon.test\"],\"content-length\":[\"\"],\"content-type\":[\"\"]}', '[\"192.168.99.1\"]', '2019-03-19 07:41:19', '2019-03-19 07:41:19');
INSERT INTO `laravel_exceptions` VALUES (2, 'ReflectionException', '-1', 'Class Auth\\LoginController does not exist', '/data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php', 779, '#0 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(779): ReflectionClass->__construct(\'Auth\\\\LoginContr...\')\n#1 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(658): Illuminate\\Container\\Container->build(\'Auth\\\\LoginContr...\')\n#2 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(609): Illuminate\\Container\\Container->resolve(\'Auth\\\\LoginContr...\', Array)\n#3 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(759): Illuminate\\Container\\Container->make(\'Auth\\\\LoginContr...\', Array)\n#4 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(233): Illuminate\\Foundation\\Application->make(\'Auth\\\\LoginContr...\')\n#5 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(833): Illuminate\\Routing\\Route->getController()\n#6 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(794): Illuminate\\Routing\\Route->controllerMiddleware()\n#7 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(695): Illuminate\\Routing\\Route->gatherMiddleware()\n#8 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->gatherRouteMiddleware(Object(Illuminate\\Routing\\Route))\n#9 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(659): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Dingo\\Api\\Http\\Request))\n#10 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(625): Illuminate\\Routing\\Router->runRoute(Object(Dingo\\Api\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#11 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(614): Illuminate\\Routing\\Router->dispatchToRoute(Object(Dingo\\Api\\Http\\Request))\n#12 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Routing/Adapter/Laravel.php(81): Illuminate\\Routing\\Router->dispatch(Object(Dingo\\Api\\Http\\Request))\n#13 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Routing/Router.php(512): Dingo\\Api\\Routing\\Adapter\\Laravel->dispatch(Object(Dingo\\Api\\Http\\Request), \'v1\')\n#14 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(126): Dingo\\Api\\Routing\\Router->dispatch(Object(Dingo\\Api\\Http\\Request))\n#15 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Dingo\\Api\\Http\\Middleware\\Request->Dingo\\Api\\Http\\Middleware\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#16 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php(65): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#17 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Barryvdh\\Debugbar\\Middleware\\InjectDebugbar->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#18 /data/htdocs/afagou/addonshop/afagou-addon-shop/app/Http/Middleware/SetLocale.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#19 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): App\\Http\\Middleware\\SetLocale->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#20 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/fideloper/proxy/src/TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#21 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Fideloper\\Proxy\\TrustProxies->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#22 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(31): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#23 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#24 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(31): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#25 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#26 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#27 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#28 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#29 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#30 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#31 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(103): Dingo\\Api\\Http\\Middleware\\Request->sendRequestThroughRouter(Object(Dingo\\Api\\Http\\Request))\n#33 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Dingo\\Api\\Http\\Middleware\\Request->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#34 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#38 /data/htdocs/afagou/addonshop/afagou-addon-shop/public/index.php(53): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#39 {main}', 'POST', 'api/login', '{\"email\":\"24147287@qq.com\",\"password\":\"123456\"}', '{\"email\":\"24147287@qq.com\",\"password\":\"123456\"}', '{\"remember_admin_59ba36addc2b2f9401580f014c7f58ea4e30989d\":\"eyJpdiI6InkxUEIwTjRPTmtnazhxUFJhWEZKUkE9PSIsInZhbHVlIjoiWlJBZm1QeVNheXRvSTNSV1JkZkQ5c054dDJSdnl5dUdjeUNzK3BmdnpQb0pNUkJOZ3JiT1wvXC9YSlo1MTgxMUJvb2p4QXUzUlFGMTV2dlhmMTRUamxuenJya0hIcEJEV0RVVjBtcEhabmFZRXFQRHRpV3ltOE9NNEpGUWN5Rk1RaVphRjBLNHBCUWQ5K2xhMmFkOEV0MmdMXC9tQXN3Z0ZRejY0cTEzQ2tFV2tJPSIsIm1hYyI6IjE2NGE5YjA1NjBmY2MyODBhYjM5OTllMjE5MGYxMzBlZDNjY2U5NTRhNTc0MDUwYjY0MWQwZDU3ODc4YjUxOTEifQ==\",\"XSRF-TOKEN\":\"eyJpdiI6IjhqS29jZUNcL201a3k2KzVvdjZOVlZBPT0iLCJ2YWx1ZSI6IjhnalhUdEZpWVVqek1mcHpPZUZlWW9GTGt2bUpaRG92WWtaWHd2VzNEaGIyUFBTUVB0OWN3c0ZLY1NqR3R3K20iLCJtYWMiOiIxMDZkZDc4NTJiMTczYTUzMzAwMTkxYmI3NDM2OWM4NmEyMzdjY2I1YjAzZjc2YmYzZGNkODFjMjY4MWU3MjY2In0=\",\"laravelvue_session\":\"eyJpdiI6ImdwM3k5bWNIcUQrdUF4c3NRS2NtRVE9PSIsInZhbHVlIjoiVUVCQllmU09abFloY1wvRDVUN3BPZERtOWZJTWI5U1ZyN3RNZk1VcnJcLzFPalZlcnQxdFVcLytlM2FYMVlFU2U2WCIsIm1hYyI6ImM5ZjQ1YTcxYTEzMDZlNjQ0NDU1ZGY2YjY1NWM1Nzg1ZDY4ZDViOTNlNzAyODE4NWQ4OTdiMjMyNzRlMzg1YmMifQ==\"}', '{\"accept-encoding\":[\"gzip, deflate\"],\"referer\":[\"http:\\/\\/addon.test\\/login\"],\"content-type\":[\"application\\/json;charset=UTF-8\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/72.0.3626.121 Safari\\/537.36\"],\"accept-language\":[\"zh-CN\"],\"x-xsrf-token\":[\"eyJpdiI6IjhqS29jZUNcL201a3k2KzVvdjZOVlZBPT0iLCJ2YWx1ZSI6IjhnalhUdEZpWVVqek1mcHpPZUZlWW9GTGt2bUpaRG92WWtaWHd2VzNEaGIyUFBTUVB0OWN3c0ZLY1NqR3R3K20iLCJtYWMiOiIxMDZkZDc4NTJiMTczYTUzMzAwMTkxYmI3NDM2OWM4NmEyMzdjY2I1YjAzZjc2YmYzZGNkODFjMjY4MWU3MjY2In0=\"],\"origin\":[\"http:\\/\\/addon.test\"],\"accept\":[\"application\\/json, text\\/plain, *\\/*\"],\"cache-control\":[\"no-cache\"],\"pragma\":[\"no-cache\"],\"content-length\":[\"47\"],\"connection\":[\"keep-alive\"],\"host\":[\"addon.test\"]}', '[\"192.168.99.1\"]', '2019-03-19 08:16:35', '2019-03-19 08:16:35');
INSERT INTO `laravel_exceptions` VALUES (3, 'ReflectionException', '-1', 'Class Auth\\LoginController does not exist', '/data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php', 779, '#0 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(779): ReflectionClass->__construct(\'Auth\\\\LoginContr...\')\n#1 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(658): Illuminate\\Container\\Container->build(\'Auth\\\\LoginContr...\')\n#2 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Container/Container.php(609): Illuminate\\Container\\Container->resolve(\'Auth\\\\LoginContr...\', Array)\n#3 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(759): Illuminate\\Container\\Container->make(\'Auth\\\\LoginContr...\', Array)\n#4 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(233): Illuminate\\Foundation\\Application->make(\'Auth\\\\LoginContr...\')\n#5 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(833): Illuminate\\Routing\\Route->getController()\n#6 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Route.php(794): Illuminate\\Routing\\Route->controllerMiddleware()\n#7 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(695): Illuminate\\Routing\\Route->gatherMiddleware()\n#8 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->gatherRouteMiddleware(Object(Illuminate\\Routing\\Route))\n#9 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(659): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Dingo\\Api\\Http\\Request))\n#10 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(625): Illuminate\\Routing\\Router->runRoute(Object(Dingo\\Api\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#11 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Router.php(614): Illuminate\\Routing\\Router->dispatchToRoute(Object(Dingo\\Api\\Http\\Request))\n#12 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Routing/Adapter/Laravel.php(81): Illuminate\\Routing\\Router->dispatch(Object(Dingo\\Api\\Http\\Request))\n#13 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Routing/Router.php(512): Dingo\\Api\\Routing\\Adapter\\Laravel->dispatch(Object(Dingo\\Api\\Http\\Request), \'v1\')\n#14 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(126): Dingo\\Api\\Routing\\Router->dispatch(Object(Dingo\\Api\\Http\\Request))\n#15 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Dingo\\Api\\Http\\Middleware\\Request->Dingo\\Api\\Http\\Middleware\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#16 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php(65): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#17 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Barryvdh\\Debugbar\\Middleware\\InjectDebugbar->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#18 /data/htdocs/afagou/addonshop/afagou-addon-shop/app/Http/Middleware/SetLocale.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#19 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): App\\Http\\Middleware\\SetLocale->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#20 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/fideloper/proxy/src/TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#21 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Fideloper\\Proxy\\TrustProxies->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#22 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(31): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#23 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#24 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(31): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#25 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#26 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#27 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#28 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#29 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#30 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Dingo\\Api\\Http\\Request))\n#31 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/dingo/api/src/Http/Middleware/Request.php(103): Dingo\\Api\\Http\\Middleware\\Request->sendRequestThroughRouter(Object(Dingo\\Api\\Http\\Request))\n#33 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(163): Dingo\\Api\\Http\\Middleware\\Request->handle(Object(Dingo\\Api\\Http\\Request), Object(Closure))\n#34 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 /data/htdocs/afagou/addonshop/afagou-addon-shop/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#38 /data/htdocs/afagou/addonshop/afagou-addon-shop/public/index.php(53): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#39 {main}', 'POST', 'api/login', '{\"email\":\"24147287@qq.com\",\"password\":\"123456\"}', '{\"email\":\"24147287@qq.com\",\"password\":\"123456\"}', '{\"remember_admin_59ba36addc2b2f9401580f014c7f58ea4e30989d\":\"eyJpdiI6InkxUEIwTjRPTmtnazhxUFJhWEZKUkE9PSIsInZhbHVlIjoiWlJBZm1QeVNheXRvSTNSV1JkZkQ5c054dDJSdnl5dUdjeUNzK3BmdnpQb0pNUkJOZ3JiT1wvXC9YSlo1MTgxMUJvb2p4QXUzUlFGMTV2dlhmMTRUamxuenJya0hIcEJEV0RVVjBtcEhabmFZRXFQRHRpV3ltOE9NNEpGUWN5Rk1RaVphRjBLNHBCUWQ5K2xhMmFkOEV0MmdMXC9tQXN3Z0ZRejY0cTEzQ2tFV2tJPSIsIm1hYyI6IjE2NGE5YjA1NjBmY2MyODBhYjM5OTllMjE5MGYxMzBlZDNjY2U5NTRhNTc0MDUwYjY0MWQwZDU3ODc4YjUxOTEifQ==\",\"XSRF-TOKEN\":\"eyJpdiI6IjhqS29jZUNcL201a3k2KzVvdjZOVlZBPT0iLCJ2YWx1ZSI6IjhnalhUdEZpWVVqek1mcHpPZUZlWW9GTGt2bUpaRG92WWtaWHd2VzNEaGIyUFBTUVB0OWN3c0ZLY1NqR3R3K20iLCJtYWMiOiIxMDZkZDc4NTJiMTczYTUzMzAwMTkxYmI3NDM2OWM4NmEyMzdjY2I1YjAzZjc2YmYzZGNkODFjMjY4MWU3MjY2In0=\",\"laravelvue_session\":\"eyJpdiI6ImdwM3k5bWNIcUQrdUF4c3NRS2NtRVE9PSIsInZhbHVlIjoiVUVCQllmU09abFloY1wvRDVUN3BPZERtOWZJTWI5U1ZyN3RNZk1VcnJcLzFPalZlcnQxdFVcLytlM2FYMVlFU2U2WCIsIm1hYyI6ImM5ZjQ1YTcxYTEzMDZlNjQ0NDU1ZGY2YjY1NWM1Nzg1ZDY4ZDViOTNlNzAyODE4NWQ4OTdiMjMyNzRlMzg1YmMifQ==\"}', '{\"accept-encoding\":[\"gzip, deflate\"],\"referer\":[\"http:\\/\\/addon.test\\/login\"],\"content-type\":[\"application\\/json;charset=UTF-8\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/72.0.3626.121 Safari\\/537.36\"],\"accept-language\":[\"zh-CN\"],\"x-xsrf-token\":[\"eyJpdiI6IjhqS29jZUNcL201a3k2KzVvdjZOVlZBPT0iLCJ2YWx1ZSI6IjhnalhUdEZpWVVqek1mcHpPZUZlWW9GTGt2bUpaRG92WWtaWHd2VzNEaGIyUFBTUVB0OWN3c0ZLY1NqR3R3K20iLCJtYWMiOiIxMDZkZDc4NTJiMTczYTUzMzAwMTkxYmI3NDM2OWM4NmEyMzdjY2I1YjAzZjc2YmYzZGNkODFjMjY4MWU3MjY2In0=\"],\"origin\":[\"http:\\/\\/addon.test\"],\"accept\":[\"application\\/json, text\\/plain, *\\/*\"],\"cache-control\":[\"no-cache\"],\"pragma\":[\"no-cache\"],\"content-length\":[\"47\"],\"connection\":[\"keep-alive\"],\"host\":[\"addon.test\"]}', '[\"192.168.99.1\"]', '2019-03-19 08:19:01', '2019-03-19 08:19:01');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2017_12_07_122845_create_oauth_providers_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_04_173148_create_admin_tables', 2);
INSERT INTO `migrations` VALUES (5, '2017_07_17_040159_create_config_table', 3);
INSERT INTO `migrations` VALUES (6, '2017_07_17_040159_create_exceptions_table', 4);

-- ----------------------------
-- Table structure for oauth_providers
-- ----------------------------
DROP TABLE IF EXISTS `oauth_providers`;
CREATE TABLE `oauth_providers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `refresh_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_providers_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `oauth_providers_provider_user_id_index`(`provider_user_id`) USING BTREE,
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@qq.com', '$2y$10$njxxcTiA0TIXNVuk735sqezUgsNjnGp6C0WBb5dhfYGkeH1vWSUIq', NULL, '2019-03-19 06:56:30', '2019-03-19 06:56:30');

SET FOREIGN_KEY_CHECKS = 1;
