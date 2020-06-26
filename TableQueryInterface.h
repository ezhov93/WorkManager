#ifndef TABLEQUERYINTERFACE_H
#define TABLEQUERYINTERFACE_H

#include <QHash>
#include <QString>

class TableQueryInterface {
 public:
  virtual QString create() const = 0;
  virtual QString prepare() const = 0;
  virtual QHash<QString, QString> bindValue() const = 0;
  virtual QString remove() const = 0;

  virtual ~TableQueryInterface() = default;

 protected:
  virtual const QString tableName() const = 0;
};

#endif  // TABLEQUERYINTERFACE_H
