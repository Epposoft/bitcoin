// Copyright (c) 2011-2014 The EPPO Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef EPPO_QT_EPPOADDRESSVALIDATOR_H
#define EPPO_QT_EPPOADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class EPPOAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit EPPOAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** EPPO address widget validator, checks for a valid EPPO address.
 */
class EPPOAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit EPPOAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // EPPO_QT_EPPOADDRESSVALIDATOR_H
