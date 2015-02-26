# yii-usercounter

This extension is a simple user counter, using MySQL für counting the number of visitors. It's a port of the [pCounter](http://andreas.droesch.de/projekte/pcounter/) from Andreas Droesch.

**The counter supports the following data:**

* users online
* total user of today
* total user of yesterday
* total user overall
* maximum user at a day
* date for the maximum

UserCounter does **not** use cookies or sessions. The count is only based on the IP address of users, but this information is stored as md5-hash in database.

With version 1.2 I have completely rewritten this component and added some new features. From now on you only have to copy the `UserCounter.php`, add some settings to you config and everthing works fine.


# Installation

## Yii 1.1
1. Copy `UserCounter.php` from folder **1.1** to `protected/components` or `protected/extensions`.
2. Open your config, in my case `protected/config/main.php`.
3. Add the component **userCounter** to the *components*-section, so it's accessable via `Yii::app()->userCounter`.
```php
return array(
    'components' => array(
        'userCounter' => array(
            // Use this when you copied the file to components folder
            'class' => 'application.components.UserCounter',

            // ... or this for extensions folder
            'class' => 'ext.UserCounter',

            // 'tableUsers' => 'pcounter_users',
            // 'tableSave' => 'pcounter_save',
            // 'autoInstallTables' => true,
            // 'onlineTime' => 10, // min
        ),
    ),
);
```
Please ensure that you use the correct class path and have a look at the options for UserCounter: `tableUsers`, `tableSave`, `autoInstallTables` and `onlineTime`. For further information [go to documentation](#documentation).
4. *(optional)* If you want UserCounter to update the user values automatically, you can add `userCounter` to the `preload`configuration. If you want to update it on your own, you have to call `Yii::app()->userCounter->refresh()`:
```php
return array(
	'preload' => array('log', 'counter'),
);
```

## Yii 2.0

Coming soon...


# Usage

Here a very simple example how you can use UserCounter. This example shows you how you access every value provided by this component.
```php
online: <?php echo Yii::app()->counter->getOnline(); ?><br />
today: <?php echo Yii::app()->counter->getToday(); ?><br />
yesterday: <?php echo Yii::app()->counter->getYesterday(); ?><br />
total: <?php echo Yii::app()->counter->getTotal(); ?><br />
maximum: <?php echo Yii::app()->counter->getMaximal(); ?><br />
date for maximum: <?php echo date('d.m.Y', Yii::app()->counter->getMaximalTime()); ?>
```
### Result

online: 9  
today: 17  
yesterday: 28  
total: 1203  
maximum: 32  
date for maximum: 17.10.2009


## Documentation

UserCounter does not use cookies or sessions to detect visits. It only consideres the IP address of the user, with all its pitfalls ‒ this component is meant to be a simple component. The IP address is stored as md5 hash, so privacy is considered.

### Options

* `tableUsers`: name of table, in which visitor information, IP address and last access timestamp, is stored.
* `tableSave`: name of table in which component statistics are stored.
* `autoInstallTables`: if `true`and tables does not exist, tables are installed to database on component initialization.
* `onlineTime`: defines the time in minutes, how long a user is considered *online* without any further action.

## Changelog

[Changelog at GitHub](https://github.com/armin-pfaeffle/yii-usercounter/tree/master/CHANGELOG.md)
