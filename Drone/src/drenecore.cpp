#include "include/dronecore.h"
#include <QUrl>

DroneCore& DroneCore::instance()
{
    static DroneCore core;
    return core;
}

DroneCore::DroneCore(QObject *parent)
    : QObject(parent)
{
}

void DroneCore::setBattery(int percent)
{
    emit batteryChanged(percent);
}

void DroneCore::setSpeed(qreal v)
{
    speedChanged(v);
}

void DroneCore::setDistance(qreal v)
{
    distanceChanged(v);
}

void DroneCore::setLevel(qreal v)
{
    levelChanged(v);
}

void DroneCore::setHeading(qreal v)
{
    headingChanged(v);
}

void DroneCore::setRtsp(QUrl v)
{
    rtspChanged(v);
}
