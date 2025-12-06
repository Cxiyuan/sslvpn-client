#include "VpnProtocolModel.h"

// FIXME: this include should to into <openconnect.h>
#ifdef _WIN32
#include <winsock2.h>
#endif
#include <openconnect.h>

VpnProtocolModel::VpnProtocolModel(QObject* parent)
    : QAbstractListModel(parent)
{
    loadProtocols();
}

int VpnProtocolModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);

    return m_protocols.size();
}

QVariant VpnProtocolModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    const VpnProtocol protocol = m_protocols.at(index.row());

    switch (role) {
    case Qt::DisplayRole:
        return QVariant{ protocol.prettyName };
    case Qt::ToolTipRole:
        return QVariant{ protocol.description };
    case Qt::UserRole + 1:
        return QVariant{ protocol.name };
    }

    return QVariant();
}

#if OPENCONNECT_CHECK_VER(5, 5)
void VpnProtocolModel::loadProtocols()
{
    m_protocols.append({ "anyconnect", "Cisco AnyConnect", "Cisco AnyConnect or openconnect" });
}
#else
void VpnProtocolModel::loadProtocols()
{
    m_protocols.append({ "anyconnect", "Cisco AnyConnect", "Cisco AnyConnect or openconnect" });
}
#endif