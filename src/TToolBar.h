#ifndef MUDLET_TTOOLBAR_H
#define MUDLET_TTOOLBAR_H

/***************************************************************************
 *   Copyright (C) 2008-2009 by Heiko Koehn - KoehnHeiko@googlemail.com    *
 *   Copyright (C) 2014 by Ahmed Charles - acharles@outlook.com            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/


#include "pre_guard.h"
#include <QDockWidget>
#include "post_guard.h"

class TAction;
class TFlipButton;

class QGridLayout;


class TToolBar : public QDockWidget
{
Q_OBJECT
        
public:
                     TToolBar( TAction *, QString, QWidget * pW = 0 );
    void             addButton( TFlipButton * pW );
    void             moveEvent( QMoveEvent * e );
    void             setVerticalOrientation(){ mVerticalOrientation = true; }
    void             setHorizontalOrientation(){ mVerticalOrientation = false; }
    void             clear();
    void             finalize();
    TAction *        mpTAction;
    void             recordMove(){ mRecordMove = true; }
    
//private:
        
    bool             mVerticalOrientation;
    QWidget *        mpWidget;
    QString          mName;
    bool             mRecordMove;
    QGridLayout *    mpLayout;
    int              mItemCount;
    
signals:
    
    
public slots:
    
    void slot_pressed();    
    
};

#endif // MUDLET_TTOOLBAR_H
