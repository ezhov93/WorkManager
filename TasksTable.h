#ifndef TASKSTABLE_H
#define TASKSTABLE_H

#include <QDebug>
#include <QSqlQuery>

#include "TableQueryInterface.h"

class SettingsTable : public TableInterface {
 public:
  virtual const QString name() const final { return "Tasks"; }
  virtual bool create() const {
    QSqlQuery query;
    QString str = QString(
        "CREATE TABLE %1 (id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "%2 VARCHAR(255)  NOT NULL, "
        "%3 VARCHAR(255)    NOT NULL )");

    if (!query.exec(str)) {
      qDebug() << "DataBase: error of create " << Table::Name;
      qDebug() << query.lastError().text();
      return false;
    } else {
      return true;
    }
    return false;
  }
  virtual bool append() const = 0;

 private:
  static constexpr auto Text = "Text";
  static constexpr auto Priority = "Priority";
};

#endif  // SETTINGSNAME_H
