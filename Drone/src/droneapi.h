#ifndef DRONEAPI_H
#define DRONEAPI_H

#include <QObject>
#include <QUrl>
#include <qqmlintegration.h>

class DroneApi : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(QUrl rtspurl READ rtspurl WRITE setRtspurl NOTIFY rtspurlChanged)
    Q_PROPERTY(double heading READ heading WRITE setHeading NOTIFY headingChanged)
    Q_PROPERTY(double level READ level WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(double distance READ distance WRITE setDistance NOTIFY distanceChanged)
    Q_PROPERTY(double speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int battery READ battery WRITE setBattery NOTIFY batteryChanged)

public:
    explicit DroneApi(QObject *parent = nullptr);

    // Getters
    QUrl rtspurl() const;
    double heading() const;
    double level() const;
    double distance() const;
    double speed() const;
    int battery() const;

public slots:
    void setRtspurl(const QUrl &url);
    void setHeading(double val);
    void setLevel(double val);
    void setDistance(double val);
    void setSpeed(double val);
    void setBattery(int val);

signals:
    void rtspurlChanged();
    void headingChanged();
    void levelChanged();
    void distanceChanged();
    void speedChanged();
    void batteryChanged();

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


    QUrl m_rtspurl;
    double m_heading = 0;
    double m_level = 0;
    double m_distance = 0;
    double m_speed = 0;
    int m_battery = 0;
};

#endif // DRONEAPI_
