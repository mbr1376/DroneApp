#ifndef DRONECORE_H
#define DRONECORE_H

#include <QObject>

class DroneCore : public QObject
{
    Q_OBJECT
public:
    static DroneCore& instance();


    void setBattery(int v);
    void setSpeed(qreal v);
    void setDistance(qreal v);
    void setLevel(qreal v);
    void setHeading(qreal v);
    void setRtsp(QUrl v);

signals:
    void batteryChanged(int);
    void speedChanged(qreal);
    void distanceChanged(qreal);
    void levelChanged(qreal);
    void headingChanged(qreal);
    void rtspChanged(const QUrl &url);
    /// handel event
    void getCapture();
    void getVideo(bool check);
    void rotate(double val);
    void heightChange(double val);
    void headingQuad(double val);
    void moveLeft(double v);
    void moveRight(double v);
    void moveFront(double v);
    void moveBack(double v);



private:
        DroneCore(QObject *parent = nullptr);
};

#endif // DRONECORE_H
