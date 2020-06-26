#ifndef SETTINGSTABLE_H
#define SETTINGSTABLE_H

#include "TableQueryInterface.h"

class SettingsTable : public TableQueryInterface {
 private:
  const QString Key = "Key";
  const QString Value = "Value";

 public:
  virtual QString create() const final {
    return QString(
               "CREATE TABLE %1 (id INTEGER PRIMARY KEY AUTOINCREMENT, "
               "%2 VARCHAR(255)  NOT NULL, "
               "%3 VARCHAR(255)    NOT NULL )")
        .arg(tableName())
        .arg(Key)
        .arg(Value);
  }
  virtual QString prepare() const final {
    return QString("INSERT INTO %1 ( %2, %3 ) VALUES (:%2, :%3)")
        .arg(tableName())
        .arg(Key)
        .arg(Value);
  }
  virtual QHash<QString, QString> bindValue() const final {
    QHash<QString, QString> values;
    values.insert(":" + Key, _key);
    values.insert(":" + Value, _value);
    return values;
  }

  virtual QString remove() const final {}

  void setKey(const QString &key) { _key = key; }
  const QString &key() { return _key; }
  void setValue(const QString &value) { _value = value; }
  const QString &value() { return _value; }

 private:
  QString _key;
  QString _value;
  virtual const QString tableName() const final { return "Settings"; }
};

#endif  // SETTINGSNAME_H
