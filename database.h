#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>

#include "TableQueryInterface.h"

class DataBase : public QObject {
  Q_OBJECT
 public:
  explicit DataBase(QObject *parent = 0) : QObject(parent) {}
  ~DataBase() = default;
  void connect();

 public slots:
  bool append(const QVariantList &);
  bool remove(const int id);

 private:
  static constexpr auto Hostname = "NameDataBase";
  static constexpr auto Name = "Name.db";

  struct Settings {
    static constexpr auto Name = "NameTable";
    static constexpr auto Key = "Key";
    static constexpr auto Value = "Value";
  };

  QSqlDatabase _db;
  bool open();
  bool restore();
  void close() { _db.close(); }
  bool createTable(TableInterface &);
};

#endif  // DATABASE_H
