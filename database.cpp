#include "DataBase.h"

#include <QDate>
#include <QDebug>
#include <QFile>
#include <QSql>
#include <QSqlError>
#include <QSqlQuery>

void DataBase::connect() {
  if (!QFile(Name).exists()) {
    restore();
  } else {
    open();
  }
}

bool DataBase::restore() {
  if (open()) {
    return (createTable()) ? true : false;
  } else {
    qDebug() << "Не удалось восстановить базу данных";
    return false;
  }
  return false;
}

bool DataBase::open() {
  _db = QSqlDatabase::addDatabase("QSQLITE");
  _db.setHostName(Hostname);
  _db.setDatabaseName(Name);
  if (_db.open())
    return true;
  else
    return false;
}

bool DataBase::createTable() {
  QSqlQuery query;
  QString str = QString(
      "CREATE TABLE %1 (id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "%2 VARCHAR(255)  NOT NULL, "
      "%3 VARCHAR(255)    NOT NULL )");

  if (!query.exec(str) {
    qDebug() << "DataBase: error of create " << Table::Name;
    qDebug() << query.lastError().text();
    return false;
  } else {
    return true;
  }
  return false;
}

bool DataBase::append(const QVariantList &data) {
  QSqlQuery query;
  query.prepare("INSERT INTO " Table::Name " ( " Table::Key ", " Table::Value
                ", " TABLE_NIK
                " ) "
                "VALUES (:FName, :SName, :Nik)");
  query.bindValue(":FName", data[0].toString());
  query.bindValue(":SName", data[1].toString());
  query.bindValue(":Nik", data[2].toString());

  if (!query.exec()) {
    qDebug() << "error insert into " << TABLE;
    qDebug() << query.lastError().text();
    return false;
  } else {
    return true;
  }
  return false;
}

bool DataBase::append(const QString &key, const QString &value) {
  QVariantList data;
  data.append(key);
  data.append(value);
  data.append(nik);

  if (append(data))
    return true;
  else
    return false;
}

bool DataBase::remove(const int id) {
  QSqlQuery query;
  query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
  query.bindValue(":ID", id);
  if (!query.exec()) {
    qDebug() << "error delete row " << TABLE;
    qDebug() << query.lastError().text();
    return false;
  } else {
    return true;
  }
  return false;
}
