#include "droneapi.h"
#include "dronecore.h"
#include <QDebug>
#include <QUrl>

DroneApi::DroneApi(QObject *parent)
    : QObject(parent)
{
    auto& core = DroneCore::instance();
    connect(&core, &DroneCore::batteryChanged,
            this, [this](int v) {
                if (m_battery == v)
                    return;
                m_battery = v;
                emit batteryChanged();
            });
    connect(&core, &DroneCore::speedChanged,
            this, [this](qreal v) {
                if (m_speed == v)
                    return;
                m_speed = v;
                emit speedChanged();
            });
    connect(&core, &DroneCore::distanceChanged,
            this, [this](qreal v) {
                if (m_distance == v)
                    return;
                m_distance = v;
                emit distanceChanged();
            });
    connect(&core, &DroneCore::levelChanged,
            this, [this](qreal v) {
                if (m_level == v)
                    return;
                m_level = v;
                emit levelChanged();
            });
    connect(&core, &DroneCore::headingChanged,
            this, [this](qreal v) {
                if (m_heading == v)
                    return;
                m_heading = v;
                emit headingChanged();
            });
    connect(&core, &DroneCore::rtspChanged,
            this, [this](QUrl v) {
                if (m_rtspurl == v)
                    return;
                m_rtspurl = v;
                emit rtspurlChanged();
            });

    connect(this,&DroneApi::getCapture,&core,&DroneCore::getCapture);
    connect(this,&DroneApi::getVideo,&core,&DroneCore::getVideo);
    connect(this,&DroneApi::rotate,&core,&DroneCore::rotate);
    connect(this,&DroneApi::heightChange,&core,&DroneCore::heightChange);
    connect(this,&DroneApi::headingQuad,&core,&DroneCore::headingQuad);
    connect(this,&DroneApi::moveBack,&core,&DroneCore::moveBack);
    connect(this,&DroneApi::moveFront,&core,&DroneCore::moveFront);
    connect(this,&DroneApi::moveLeft,&core,&DroneCore::moveLeft);
    connect(this,&DroneApi::moveRight,&core,&DroneCore::moveRight);
}

// ---- getters
QUrl DroneApi::rtspurl() const { return m_rtspurl; }
double DroneApi::heading() const { return m_heading; }
double DroneApi::level() const { return m_level; }
double DroneApi::distance() const { return m_distance; }
double DroneApi::speed() const { return m_speed; }
int DroneApi::battery() const { return m_battery; }

// ---- setters
void DroneApi::setRtspurl(const QUrl &url) {
    if (m_rtspurl == url) return;
    m_rtspurl = url;
    emit rtspurlChanged();
}

void DroneApi::setHeading(double val) {
    if (qFuzzyCompare(m_heading, val)) return;
    m_heading = val;
    emit headingChanged();
}

void DroneApi::setLevel(double val) {
    if (qFuzzyCompare(m_level, val)) return;
    m_level = val;
    emit levelChanged();
}

void DroneApi::setDistance(double val) {
    m_distance = val;
    emit distanceChanged();
}

void DroneApi::setSpeed(double val) {
    m_speed = val;
    emit speedChanged();
}

void DroneApi::setBattery(int val) {
    m_battery = val;
    emit batteryChanged();
}

