/* MySQL Schema for UserCounter 1.2                   */
/* http://www.yiiframework.com/extension/usercounter/ */
/* https://github.com/armin-pfaeffle/yii-usercounter/ */

DROP TABLE IF EXISTS `pcounter_users`;
CREATE TABLE `pcounter_users` (
	`user_ip` varchar(255) NOT NULL PRIMARY KEY,
	`user_time` int(10) unsigned NOT NULL
);

DROP TABLE IF EXISTS `pcounter_save`;
CREATE TABLE `pcounter_save` (
	`save_name` varchar(10) NOT NULL,
	`save_value` int(10) unsigned NOT NULL
);

INSERT INTO `pcounter_save` VALUES ('day_time', 0);
INSERT INTO `pcounter_save` VALUES ('counter', 0);
INSERT INTO `pcounter_save` VALUES ('yesterday', 0);
INSERT INTO `pcounter_save` VALUES ('max_count', 0);
INSERT INTO `pcounter_save` VALUES ('max_time', 0);
